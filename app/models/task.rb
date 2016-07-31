class Task < ApplicationRecord
  belongs_to :user,     optional: true
  belongs_to :category

  enum status: {
    incomplete:  1,
    complete:    2,
  }

  scope :unassigned, -> { where(user: nil) }

  validates :title,           presence: true, length: { in: 1..255 }

  def claim(u)
    self.user = u
  end
end

