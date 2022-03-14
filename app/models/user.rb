class User < ActiveRecord::Base
  has_many :donations
  has_many :memberships
  validates :email, presence: true, uniqueness: true
end