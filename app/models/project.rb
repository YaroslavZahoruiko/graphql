# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user_account
  has_many :tasks, dependent: :destroy
end
