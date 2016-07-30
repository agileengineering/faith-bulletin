class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum role: {
    read_only: 1,
    member:    2,
    moderator: 3,
    owner:     4,
  }

end

