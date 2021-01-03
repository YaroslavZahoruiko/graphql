# frozen_string_literal: true

module Projects
  module UpdateSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:updateProject).schema do
          required(:title).filled(:str?)
        end
      end
    end
  end
end
