class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(strong_params)
        if @user.save
            redirect_to user_url(@user)
        else
            render :new
    end

    def strong_params
        params.require(:user).permit(:user_name, :password)
    end

end