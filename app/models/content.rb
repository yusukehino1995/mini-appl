class Content < ApplicationRecord
  belongs_to :user
  validates :nickname, :title, :text, presence: true
end
