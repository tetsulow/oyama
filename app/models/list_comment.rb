class ListComment < ApplicationRecord
  validates :comment, presence: true
  validates :commenter, presence: true
  belongs_to:list
end
