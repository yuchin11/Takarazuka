class TweetsController < ApplicationController

    def create
        tweet = current_user.tweets.create(yuchin_id: params[:yuchin_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        tweet = Tweet.find_by(yuchin_id: params[:yuchin_id], user_id: current_user.id)
        tweet.destroy
        redirect_back(fallback_location: root_path)
    end

end
