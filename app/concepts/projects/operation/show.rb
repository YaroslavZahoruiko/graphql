# frozen_string_literal: true

module Projects::Operation
  class Show < Trailblazer::Operation
    step Model(Project, :find)
    step :result

    def result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
