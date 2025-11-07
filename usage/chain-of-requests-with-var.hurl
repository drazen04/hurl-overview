#----------- GET ALL USERS -----------#
GET http://{{host}}:{{port}}/users
HTTP 200

#----------- CREATE USER -----------#
POST http://{{host}}:{{port}}/users
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
DELETE http://{{host}}:{{port}}/users/{{id}}
HTTP 204

#----------- USER SHOULD NOT EXISTS ANYMORE -----------#
GET http://{{host}}:{{port}}/users/{{id}}
HTTP 404
