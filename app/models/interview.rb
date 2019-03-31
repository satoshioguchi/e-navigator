class Interview < ApplicationRecord
  belongs_to :user
  enum propriety: {却下: 1, 承認: 2}
end
