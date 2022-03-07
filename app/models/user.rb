class User < ActiveRecord::Base
  has_many :donations
  has_many :memberships
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end