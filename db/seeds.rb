user1 = User.create(email:"test1@gmail.com", username: "Liz Smith")
user2 = User.create(email:"test2@gmail.com", username: "Tina Swore")
Membership.create(user:user1)
Membership.create(user:user2)
Donation.create(user:user1)
Donation.create(user:user2)
