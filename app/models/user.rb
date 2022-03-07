class User < ActiveRecord::Base
  has_many :donations
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end