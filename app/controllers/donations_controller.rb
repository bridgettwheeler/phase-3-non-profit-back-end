class DonationsController < ApplicationController
    
    #index action (gets all the data)
     get "/donations" do 
         Donation.all.to_json(include: :user)
     end
 
     #create action
     post "/donations" do
         donation = Donation.new(params)
         if donation.save
             donation.to_json(include :user)
         else
             donation.errors.full_messages.to_sentance
         end
     end
 
     #index action (gets one piece of data that meets params)
     get "/donations/:id" do
         begin
             Donation.find(params["id"]).to_json(include: :user)
         rescue ActiveRecord::RecordNotFound => editing
             {errors: e}.to_json
         end
     end
    #updating something
     patch "/donations/:id" do
     #could alos use the same method we used the begin and rescue method above: User.find(params["id"])
         donation = Donation.find_by_id(params ["id"])
         if donation && donation.update(params)
             donation.to_json(include: :user)
         elsif !donation
             {errors: "record not found with id #{params ['id']}"}.to_json
         else
             donation.errors.full_messages.to_sentence
         end
     end
 
     delete "/donations/:id" do 
     #first finding the user we want to delete
         donation = Donation.find_by_id(params ["id"])
         if donation.destroy
            {messages: "record seccessfully destroyed"}.to_json
         else
             {errors: "record not found with id #{params ['id']}"}.to_json
         end
     end
end