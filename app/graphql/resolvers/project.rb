# frozen_string_literal: true

module Resolvers
  class Project < AuthBase
    type Types::ProjectType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      match_operation ::Projects::Operation::Show.call(
        params: { id: id },
        current_user: current_user
      )
    end
  end
end
