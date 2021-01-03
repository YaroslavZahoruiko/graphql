# frozen_string_literal: true

module Projects
  module IndexSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:projects).each do
          required(:title).filled(:str?)
        end
      end
    end

    SuccessWithTasks = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:projects).each do
          required(:title).filled(:str?)
          required(:tasks).each do
            required(:title).filled(:str?)
            required(:description).filled(:str?)
          end
        end
      end
    end
  end
end
