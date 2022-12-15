class Blog < ApplicationRecord
  validates :content,presence: true
  validates :title,presence: true
  belongs_to :user
end
