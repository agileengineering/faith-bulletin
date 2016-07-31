class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :memberships
  has_many :groups, through: :memberships

  def is_owner?(group)
    self.memberships.where(role: :owner).map(&:group).include? group
  end
end
