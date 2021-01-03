# frozen_string_literal: true

module Mutations
  class AuthenticatableMutation < BaseMutation
    def ready?(**_args)
      return true if current_user.present?

      raise JWTSessions::Errors::Unauthorized
    end
  end
end
