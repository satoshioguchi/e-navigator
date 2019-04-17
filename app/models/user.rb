class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :request_user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum gender: {man: 1, woman: 2}
  has_many :interviews, dependent: :destroy
end
