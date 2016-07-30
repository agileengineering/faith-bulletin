class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :categories

  validates :title, presence: true, length: { in: 1..255 }

  def make_owner(user)
    self.memberships.create(user: user, role: :owner)
  end
end

