# frozen_string_literal: true

module Types
  module Inputs
    class ProjectInput < ::Types::Base::InputObject
      graphql_name 'ProjectInput'
      description 'Project input'

      argument :title,
               String,
               required: true,
               description: 'Title for project',
               prepare: ->(title, _ctx) { title.strip }
    end
  end
end
