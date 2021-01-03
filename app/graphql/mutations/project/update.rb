# frozen_string_literal: true

module Mutations
  module Project
    class Update < AuthenticatableMutation
      description I18n.t('graphql.mutations.project.update.desc')

      type Types::ProjectType

      argument :id, ID, required: true
      argument :input, Types::Inputs::ProjectInput, required: true

      def resolve(input:, id:)
        match_operation ::Projects::Operation::Update.call(
          params: input.to_h.merge(id: id),
          current_user: current_user
        )
      end
    end
  end
end
