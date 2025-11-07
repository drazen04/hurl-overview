#----------- CREATE USER -----------#
POST http://localhost:3000/users
{
    "name": "pluto",
    "email": "pluto@mail.com"
}
HTTP 201

[Captures]
id: jsonpath "$.id"

[Asserts]
variable "id" isUuid
