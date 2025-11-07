#----------- GET ALL USERS -----------#
GET http://localhost:3000/users
HTTP 200

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


#----------- DELETE USER -----------#
DELETE http://localhost:3000/users/{{id}}
HTTP 204

#----------- USER SHOULD NOT EXISTS ANYMORE -----------#
GET http://localhost:3000/users/{{id}}
HTTP 404
