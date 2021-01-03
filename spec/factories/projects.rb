# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    transient do
      tasks_count { 3 }
    end

    title { FFaker::Lorem.word }

    trait :with_user_account do
      before(:create) do |project|
        project.user_account = create(:user_account, :with_user_profile)
      end
    end

    trait :with_tasks do
      after(:create) do |project, evaluator|
        create_list(:task, evaluator.tasks_count, project: project)
      end
    end
  end
end
