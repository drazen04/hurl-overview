# Hurl Overview

A simple project demonstrating [Hurl](https://hurl.dev) - a command-line tool for running and testing HTTP requests with plain text files.

## Prerequisites

- **Node.js** and **npm** - To run the test API server
- **Hurl CLI** - Install from [hurl.dev](https://hurl.dev/docs/installation.html)
  ```bash
  # macOS
  brew install hurl

  # Linux
  curl -LO https://github.com/Orange-OpenSource/hurl/releases/latest/download/hurl_amd64.deb
  sudo dpkg -i hurl_amd64.deb

  # Linux (mise)
  mise install hurl
  mise use -g hurl

  # Windows
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
   hurl --test concepts/1-simple-request.hurl
   hurl --test usage/chain-of-requests.hurl
   ```

## Running Examples

### Concepts (Progressive Examples)

```bash
# 1. Simple HTTP request with status assertion
hurl --test concepts/1-simple-request.hurl

# 2. Capture data from response using JSONPath
hurl --test concepts/2-captures.hurl

# 3. Assertions - validate response content
hurl --test concepts/4-asserts.hurl
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
