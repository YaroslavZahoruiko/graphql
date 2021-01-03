# frozen_string_literal: true

module Mutations
  module Project
    class Create < AuthenticatableMutation
      description I18n.t('graphql.mutations.project.create.desc')

      type Types::ProjectType

      argument :input, Types::Inputs::ProjectInput, required: true

      def resolve(input:)
        match_operation ::Projects::Operation::Create.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
