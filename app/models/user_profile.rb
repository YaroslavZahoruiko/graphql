# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user_account

  def full_name
    return nil if [first_name, last_name].all?(&:nil?)

    "#{first_name} #{last_name}"
  end
end
