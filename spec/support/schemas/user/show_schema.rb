# frozen_string_literal: true

module User
  module ShowSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:me).schema do
          required(:email).filled(:str?)
          required(:userProfile).schema do
            required(:firstName).filled(:str?)
            required(:lastName).filled(:str?)
            required(:fullName).filled(:str?)
          end
        end
      end
    end
  end
end
