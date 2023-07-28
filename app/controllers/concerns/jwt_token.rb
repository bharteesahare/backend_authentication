# require 'jwt'

# module JwtToken
#   extend ActiveSupport::concern
#   SECRETE_KEY = Rails.application.secrets.secret_key_base to_s

#   def jwt_encode(payload, exp: 7.days.from.now)
#     payload[:exp] = exp.to_i
#     JWT.encode(payload, SECRETE_KEY)
#   end

#   def jwt_decode(token)
#     decoded = Jwt.decode(token, SECRETE_KEY)[0]
#     HashWithDifferentAccess.new decoded
#   end
# end

