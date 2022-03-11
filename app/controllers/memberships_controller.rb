class MembershipsController < ApplicationController
    
    #index action (gets all the data)
     get "/memberships" do 
         Membership.all.to_json(include: :user)
     end
 
     #create action
     post "/memberships" do
        user = Membership.find_by_email(params[:email])
        if user
         membership = user.memberships.build(start_date: params[:startDate], end_date: params[:endDate], year: params[:year])
         if membership.save
             membership.to_json(include: :user)
         else
             membership.errors.full_messages.to_sentance
         end
         else 
            {error: "could not find user with email: #{params[:email]}"}.to_json
         end
     end
 
     #index action (gets one piece of data that meets params)
     get "/memberships/:id" do
         begin
             Membership.find(params["id"]).to_json(include: :user)
         rescue ActiveRecord::RecordNotFound => editing
             {errors: e}.to_json
         end
     end
    #updating something
     patch "/memberships/:id" do
     #could alos use the same method we used the begin and rescue method above: User.find(params["id"])
         membership = Membership.find_by_id(params ["id"])
         if membership && membership.update(params)
             membership.to_json(include: :user)
         elsif !membership
             {errors: "record not found with id #{params ['id']}"}.to_json
         else
             membership.errors.full_messages.to_sentence
         end
     end
 
     delete "/memberships/:id" do 
     #first finding the user we want to delete
         membership = Membership.find_by_id(params ["id"])
         if membership.destroy
            {messages: "record seccessfully destroyed"}.to_json
         else
             {errors: "record not found with id #{params ['id']}"}.to_json
         end
     end
end