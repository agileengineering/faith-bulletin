class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :categories
  has_many :tasks, through: :categories

  has_attached_file :profile_pic, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "http://placehold.it/100x100"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  validates :title, presence: true, length: { in: 1..255 }

  def make_owner(user)
    self.memberships.create(user: user, role: :owner)
  end
end

