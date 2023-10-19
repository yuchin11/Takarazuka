# likeをtweetに変えました
class Tweet < ApplicationRecord
  belongs_to :yuchin
  belongs_to :user

  validates_uniqueness_of :yuchin_id, scope: :user_id
end
