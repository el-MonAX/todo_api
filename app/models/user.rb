class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :email, :encrypted_password, presence: true
  has_many :projects
end
