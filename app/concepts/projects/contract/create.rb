# frozen_string_literal: true

module Projects::Contract
  class Create < Reform::Form
    feature Reform::Form::Dry

    property :title

    validation :default do
      required(:title).filled(:str?)
    end
  end
end
