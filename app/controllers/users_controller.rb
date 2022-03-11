class UsersController < ApplicationController

   #index action (gets all the data)
    get "/users" do 
        User.all.to_json(include: [:donations, :memberships])
    end

    #create action
    post "/users" do
        user = user.build(first_name: params[:firstName], last_name: params[:lastName], address_1: params[:address1], address_2: params[:address2], city: params[:city], state: params[:state], zip_code: params[:zip], email: params[:email], phone: params[:phone])
         if user.save
             user.to_json(include: :user)
         else
             user.errors.full_messages.to_sentance
         end
        end
    end

    #index action (gets one piece of data that meets params)
    get "/users/:id" do
        begin
            User.find(params["id"]).to_json(include: [:donations, :memberships])
        rescue ActiveRecord::RecordNotFound => editing
            {errors: e}.to_json
        end
    end
   #updating something
    patch "/users/:id" do
        find_user
        if @user && @user.update(params)
            @user.to_json(include: [:donations, :memberships])
        elsif !@user
            {errors: "record not found with id #{params ['id']}"}.to_json
        else
            @user.errors.full_messages.to_sentence
        end
    end

    delete "/users/:id" do 
        find_user
        if @user&.destroy
            {messages: "record seccessfully destroyed"}.to_json
            
        else
            {errors: "record not found with id #{params ['id']}"}.to_json
        end
    end

    private

    def find_user
        @user = User.find_by_id(params ["id"])
end


  