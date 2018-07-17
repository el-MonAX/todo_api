# frozen_string_literal: true

# Comment
class Comment < ApplicationRecord
  belongs_to :task

  validates :text, presence: true
end
