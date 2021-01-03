# frozen_string_literal: true

module Types
  class CompleteType < Base::Object
    graphql_name 'CompleteType'
    description I18n.t('graphql.types.complete_type.desc')

    field :success,
          Boolean,
          null: false,
          description: I18n.t('graphql.types.complete_type.fields.success')
  end
end
