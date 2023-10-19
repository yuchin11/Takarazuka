class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
    end

    def following
        @user  = User.find(params[:id])
        @users = @user.followings
        render 'show_follow'
    end
  
    def followers
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follower'
    end

    def update
       @user = User.find(params[:id])
        if user.update(user_params)
          redirect_to :action => "show", :id => user.id
        else
          redirect_to :action => "new"
        end
    end
   
   

end    