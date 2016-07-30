class Task < ApplicationRecord
  belongs_to :user, optional: true

  validates :title,           presence: true, length: { in: 1..255 }
end

