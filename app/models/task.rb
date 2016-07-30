class Task < ApplicationRecord
  belongs_to :user, optional: true

  validates :title,           presence: true, length: { in: 1..255 }

  def claim(u)
    self.user = u
  end
end

