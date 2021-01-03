# frozen_string_literal: true

module Mutations
  module Project
    class Destroy < AuthenticatableMutation
      description I18n.t('graphql.mutations.project.destroy.desc')

      type Types::CompleteType

      argument :id, ID, required: true

      def resolve(id:)
        match_operation ::Projects::Operation::Destroy.call(
          params: { id: id },
          current_user: current_user
        )
      end
    end
  end
end
