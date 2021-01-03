# frozen_string_literal: true

module Projects::Operation
  class Update < Trailblazer::Operation
    step Model(Project, :find)
    step Contract::Build(constant: Projects::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :result

    def result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
