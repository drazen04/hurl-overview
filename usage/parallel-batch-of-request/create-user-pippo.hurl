#----------- CREATE USER -----------#
POST http://localhost:3000/users
{
    "name": "pippo",
    "email": "pippo@mail.com"
}
HTTP 201

[Captures]
id: jsonpath "$.id"

[Asserts]
variable "id" isUuid
