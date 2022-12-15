class Blog < ApplicationRecord
  has_many :favorite, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :content,presence: true
  validates :title,presence: true
  belongs_to :user
end
