class List < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :list_comments, dependent: :destroy

end
