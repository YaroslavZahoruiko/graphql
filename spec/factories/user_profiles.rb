# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    association :user_account
  end
end
