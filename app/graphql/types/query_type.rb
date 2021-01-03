# frozen_string_literal: true

module Types
  class QueryType < Types::Base::Object
    field :me,
          resolver: Resolvers::Me,
          description: I18n.t('graphql.queries.me')
    field :project,
          resolver: Resolvers::Project,
          description: I18n.t('graphql.queries.project')
    field :projects,
          resolver: Resolvers::Projects,
          description: I18n.t('graphql.queries.projects')
  end
end
