class List < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :list_comments, dependent: :destroy
  has_many :list_tags, dependent: :destroy
  has_many :tags, through: :list_tags, dependent: :destroy

end
