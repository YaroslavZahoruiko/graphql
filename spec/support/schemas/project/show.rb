# frozen_string_literal: true

module Projects
  module ShowSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:project).schema do
          required(:title).filled(:str?)
        end
      end
    end

    SuccessWithTasks = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:project).schema do
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
