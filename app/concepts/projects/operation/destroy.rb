# frozen_string_literal: true

module Projects::Operation
  class Destroy < Trailblazer::Operation
    step Model(Project, :find)
    step :destroy_project
    step :result

    def destroy_project(_ctx, model:, **)
      model.destroy
    end

    def result(ctx, **)
      ctx['result'] = { success: true }
    end
  end
end
