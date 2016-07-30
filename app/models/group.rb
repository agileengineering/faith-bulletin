class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :title, presence: true, length: { in: 1..255 }
end

