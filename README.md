## Test this with http://editor2.swagger.io/#!/
swagger: '2.0'
info:
  title: Authentication service
  description: Ruby + MySQL database
  version: "1.0.0"
  contact:
    name: Miguel Ballen
    email: migaballengal@unal.edu.co
  license: 
    name: xxx
# the domain of the service
host: 192.168.99.101:3000
# array of all schemes that your API supports
schemes:
  - https
# will be prefixed to all paths
basePath: /
produces:
  - application/json
paths:
  /users:
    post:
      summary: Creates a new user
      description: |
        .
      parameters:
        - name: user
          in: header
          description: user object.
          required: true
          type: number
          format: double
        
      responses:
        200:
          description: Created
          schema:
            type: array
            items:
              $ref: '#/definitions/User'
        400:
          description: Bad request
        500:
          description: Internal server error
        default:
          description: Unexpected error
          schema:
            $ref: '#/definitions/Error'
  /authenticate:
    post:
      summary: Authenticate user
      description: |
        .
      parameters:
        - name: email
          in: query
          description: user mail.
          required: true
          type: number
          format: double
        - name: password
          in: query
          description: user password.
          required: true
          type: number
          format: double
      responses:
        200:
          description: return token jwt
        401:
          description: invalid credentials
        default:
          description: Unexpected error
          schema:
            $ref: '#/definitions/Error'
  /authorize:
    get:
      summary: authorize a user
      description: .
      parameters:
        - name: jwt_authorization
          in: header
          description: .
          required: true
          type: number
          format: double
      responses:
        200:
          description: Current user
        401: 
          description: Unathorized
        default:
          description: Unexpected error
          schema:
            $ref: '#/definitions/Error'
  
definitions:
  User:
    type: object
    properties:
      user_id:
        type: integer
      first_name:
        type: string
      last_name: 
        type: string
      age:
        type: number
      password_digest:
        type: string
  
  
  Error:
    type: object
    properties:
      code:
        type: integer
        format: int32
      message:
        type: string
      fields:
        type: string
