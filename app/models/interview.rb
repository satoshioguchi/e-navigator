class Interview < ApplicationRecord
  default_scope -> { order(schedule: :asc) }
  belongs_to :user
  enum propriety: {reject: 1, approval: 2, reservation: 3}
end
