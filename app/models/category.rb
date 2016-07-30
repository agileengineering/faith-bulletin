class Category < ApplicationRecord
  belongs_to :group
  has_many   :categories

  enum status: {
    incomplete:  1,
    complete:    2,
  }

  validates :title,           presence: true, length: { in: 1..255 }

  def claim(u)
    self.user = u
  end
end

