# frozen_string_literal: true

module Types
  class ProjectType < Base::Object
    graphql_name 'ProjectType'
    description I18n.t('graphql.types.project_type.desc')

    field :title,
          String,
          null: false,
          description: I18n.t('graphql.types.project_type.fields.title')

    field :tasks, [Types::TaskType], null: false

    def tasks
      BatchLoader::GraphQL.for(object.id).batch(default_value: [], key: object.id) do |project_ids, loader|
        Task.where(project_id: project_ids).each do |task|
          loader.call(task.project_id) { |memo| memo << task }
        end
      end
    end
  end
end
