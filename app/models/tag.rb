class Tag < ApplicationRecord
  has_many :list_tags, dependent: :destroy
  has_many :lists, through: :list_tags, dependent: :destroy
end
