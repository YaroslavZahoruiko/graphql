# frozen_string_literal: true

module Resolvers
  class Projects < AuthBase
    type [Types::ProjectType], null: true

    def resolve
      match_operation ::Projects::Operation::Index.call(current_user: current_user)
    end
  end
end
