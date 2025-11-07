## Test without body. Should create anonymous user
POST http://localhost:3000/users
HTTP 201

[Asserts]
jsonpath "$.name" == "Anonymous"
