# Hurl Overview

A simple project demonstrating [Hurl](https://hurl.dev) - a command-line tool for running and testing HTTP requests with plain text files.

## Hurl in a Nutshell
Hurl's docs speak for themself, but if you are too lazy to read, here is what hurl is in his essence:
- hurl is a tool built on top of cURL's engine (try to run hurl with ```-v``` flag and hurl will show you its 'heart')
- hurl is a HTTP request test runner with some load testing functionalities in it

## Prerequisites

- **Node.js** and **npm** - To run the test API server
- **Hurl CLI** - Install from [hurl.dev](https://hurl.dev/docs/installation.html)
  ```bash
  ## Quick installation commands if you have use package manager

  # macOS (via Homebrew)
  brew install hurl

  # Linux (via mise)
  mise install hurl
  mise use -g hurl

  # Windows (via Chocolatey)
  choco install hurl
  ```

## Quick Start

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start the test server:**
   ```bash
   npm start
   ```
   Server runs on `http://localhost:3000`

3. **Run Hurl examples** (in a new terminal):
   ```bash
   # Run all examples
   ./test-hurl-files.sh

   # Or run specific examples
   hurl --test basic-concepts/1-simple-request.hurl
   hurl --test usage/chain-of-requests.hurl
   ```

## Running Examples

### basic-concepts (Progressive Examples)

```bash
# 1. Simple HTTP request with status assertion
hurl --test basic-concepts/1-simple-request.hurl

# 2. Capture data from response using JSONPath
hurl --test basic-concepts/2-captures.hurl

# 3. Assertions - validate response content
hurl --test basic-concepts/4-asserts.hurl
```

### Usage (Complete Workflow)

```bash
# Full CRUD workflow: GET → POST → Capture → DELETE → Verify
hurl --test usage/chain-of-requests.hurl

# Run with verbose output
hurl --test --verbose usage/chain-of-requests.hurl

# Stress test - repeat 100 times
./usage/repeat.sh 100
```

## API Endpoints

The test server provides these endpoints:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/users` | Get all users |
| GET | `/users/:id` | Get user by ID |
| POST | `/users` | Create user (with body) or anonymous user (without body) |
| PUT | `/users/:id` | Update user |
| DELETE | `/users/:id` | Delete user |
