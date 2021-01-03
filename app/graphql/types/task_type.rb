# frozen_string_literal: true

module Types
  class TaskType < Base::Object
    graphql_name 'TaskType'
    description I18n.t('graphql.types.task_type.desc')

    field :title,
          String,
          null: false,
          description: I18n.t('graphql.types.task_type.fields.title')

    field :description,
          String,
          null: true,
          description: I18n.t('graphql.types.task_type.fields.description')
  end
end
