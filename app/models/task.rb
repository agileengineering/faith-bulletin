class Task < ApplicationRecord
  belongs_to :user, optional: true

  enum status: {
    incomplete:  1,
    complete:    2,
  }

  validates :title,           presence: true, length: { in: 1..255 }

  def claim(u)
    self.user = u
  end
end

