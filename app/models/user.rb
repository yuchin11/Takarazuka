class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :yuchins, dependent: :destroy
        validates :name, presence: true
        validates :profile, length: { maximum: 200 } 

        has_many :tweets, dependent: :destroy
        has_many :liked_yuchins, through: :tweets, source: :yuchin
        has_many :comments, dependent: :destroy
        has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
        has_many :followings, through: :following_relationships
        has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
        has_many :followers, through: :follower_relationships

        def following?(other_user)
          following_relationships.find_by(following_id: other_user.id)
        end
      
        def follow!(other_user)
          following_relationships.create!(following_id: other_user.id)
        end
      
        def unfollow!(other_user)
          following_relationships.find_by(following_id: other_user.id).destroy
        end

        def already_liked?(yuchin)
          self.tweets.exists?(yuchin_id: yuchin.id)
        end
        
        mount_uploader :image, ImageUploader
 
 end
