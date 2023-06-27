# config/initializers/jwt.rb
JWT_SECRET = "Bsnasimento@230022" # Chave secreta usada para assinar e verificar os tokens

# Método para codificar um payload e retornar um token JWT
def encode_token(payload)
  JWT.encode(payload, JWT_SECRET)
end

# Método para decodificar um token JWT e retornar o payload
def decode_token(token)
  JWT.decode(token, JWT_SECRET)[0]
rescue JWT::DecodeError
  nil
end
