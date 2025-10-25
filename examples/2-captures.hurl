POST http://localhost:3000/users
```json
{
    "name": "pippo",
    "email": "pippo@mail.com"
}
```

HTTP 201

[Captures]
id: jsonpath "$.id"
# ^^^^^^^^^^^^^^^^^ captures values from response
