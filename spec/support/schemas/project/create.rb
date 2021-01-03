# frozen_string_literal: true

module Projects
  module CreateSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:createProject).schema do
          required(:title).filled(:str?)
        end
      end
    end
  end
end
