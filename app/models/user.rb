# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { in: 3..50 }
  validates :password, length: { in: 8..72 }
end
