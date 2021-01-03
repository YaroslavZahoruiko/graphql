# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
  end
end
