# frozen_string_literal: true

module Projects::Operation
  class Create < Trailblazer::Operation
    step :model!
    step Contract::Build(constant: Projects::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :result

    def model!(ctx, current_user:, **)
      ctx[:model] = current_user.projects.new
    end

    def result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
