# frozen_string_literal: true

class UserAccount < ApplicationRecord
  has_secure_password

  has_one :user_profile, dependent: :destroy
  has_many :projects, dependent: :destroy
end
