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
# ^^^^^^^^^^^^^^^^^ captures values from response

[Asserts]
variable "id" isUuid


#----------- GET CREATED USER -----------#
GET http://localhost:3000/users/{{id}}
HTTP 200

# TODO: ADD DELETE USER
