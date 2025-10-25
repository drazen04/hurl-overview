import Fastify from "fastify";
import { randomUUID } from "crypto";

const fastify = Fastify({ logger: true });

// In-memory storage
const users = new Map();
const items = new Map();

// User routes
fastify.get("/users", async (request, reply) => {
  return Array.from(users.values());
});

fastify.get("/users/:id", async (request, reply) => {
  const user = users.get(request.params.id);
  if (!user) {
    reply.code(404);
    return { error: "User not found" };
  }
  return user;
});

fastify.post("/users", async (request, reply) => {
  const id = randomUUID();
  const user = {
    id,
    name: request.body.name || "Anonymous",
    email: request.body.email || `user${id}@example.com`,
    createdAt: new Date().toISOString(),
  };
  users.set(id, user);
  request.log.info(`users: ${users.entries.length}`);
  reply.code(201);
  return user;
});

fastify.put("/users/:id", async (request, reply) => {
  const id = request.params.id;
  if (!users.has(id)) {
    reply.code(404);
    return { error: "User not found" };
  }
  const user = {
    id,
    name: request.body.name,
    email: request.body.email,
    createdAt: users.get(id).createdAt,
    updatedAt: new Date().toISOString(),
  };
  users.set(id, user);
  return user;
});

fastify.delete("/users/:id", async (request, reply) => {
  const id = request.params.id;
  if (!users.has(id)) {
    reply.code(404);
    return { error: "User not found" };
  }
  users.delete(id);
  // Delete all items belonging to this user
  for (const [itemId, item] of items.entries()) {
    if (item.userId === id) {
      items.delete(itemId);
    }
  }
  reply.code(204);
  return;
});

// Start server
const start = async () => {
  try {
    await fastify.listen({ port: 3000, host: "0.0.0.0" });
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();
