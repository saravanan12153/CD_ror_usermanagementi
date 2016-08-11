class UsersController < ApplicationController
    def index
      @users = User.all

    end

    def new
        @flash_messages = flash[:errors]
    end

    def create
        user = User.new(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], password: params[:password])
        if !user.valid?
            flash[:errors] = user.errors.full_messages
            redirect_to '/new'
        else
            user.save
            redirect_to '/'
        end
    end
    def show
        @user = User.find(params[:id])
        @flash_messages = flash[:success]
    end
    def edit
        @user = User.find(params[:id])
        @flash_messages = flash[:errors]
    end
    def update
        @user = User.find(params[:id]).update( first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address])
		redirect_to '/users/'+params[:id]
        flash[:success] = "Successfully updated!"
    end
    def delete
        User.find(params[:id]).destroy
        redirect_to '/'
    end
end
