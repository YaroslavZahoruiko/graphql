# frozen_string_literal: true

FactoryBot.define do
  factory :user_account do
    email { FFaker::Internet.unique.email }
    password { 'password' }

    trait :with_user_profile do
      after(:create) do |account|
        account.user_profile = create(:user_profile, user_account: account)
      end
    end
  end
end
