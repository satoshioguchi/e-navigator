class Interview < ApplicationRecord
  default_scope -> { order(schedule: :asc) }
  belongs_to :user
   enum propriety: {却下: 1, 承認: 2, 保留: 3}
end
