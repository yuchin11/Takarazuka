class Yuchin < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

    has_many :tweets, dependent: :destroy
    has_many :liked_users, through: :tweets, source: :user
    has_many :comments, dependent: :destroy
end
