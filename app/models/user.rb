class User < ActiveRecord::Base
  has_many :donations
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  get "/users" do
    User.all.to_json
  end

  post "/users" do
    user = User.new(params)
    if user.save
        user.to_json(include :donations, :memberships)
    #need else
    end
end