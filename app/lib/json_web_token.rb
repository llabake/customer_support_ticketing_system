# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base
  ALGORITHM = 'HS256'

  class << self
    def encode(payload)
      payload = add_claims(payload)
      JWT.encode(payload, SECRET_KEY, ALGORITHM)
    end

    def decode(token)
      decoded = JWT.decode(token, SECRET_KEY, true, algorithm: ALGORITHM)[0]
      HashWithIndifferentAccess.new decoded
    rescue JWT::DecodeError => e
      raise ExceptionHandler::InvalidToken, e.message
    end

    private

    def add_claims(payload)
      exp           = Time.zone.now.to_i + 36_000
      payload[:exp] = exp
      payload
    end
  end
end
