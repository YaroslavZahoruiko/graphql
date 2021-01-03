# frozen_string_literal: true

module Projects
  module DestroySchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:destroyProject).schema do
          required(:success).filled(:bool?)
        end
      end
    end
  end
end
