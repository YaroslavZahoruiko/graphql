# frozen_string_literal: true

module Types
  class MutationType < Types::Base::Object
    field :user_sign_up, mutation: Mutations::User::SignUp
    field :user_sign_out, mutation: Mutations::User::SignOut
    field :user_sign_in, mutation: Mutations::User::SignIn

    field :refresh_token, mutation: Mutations::Auth::RefreshToken

    field :create_project, mutation: Mutations::Project::Create
    field :update_project, mutation: Mutations::Project::Update
    field :destroy_project, mutation: Mutations::Project::Destroy
  end
end
