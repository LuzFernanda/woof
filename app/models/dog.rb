class Dog < ActiveRecord::Base
  belongs_to :raza
  belongs_to :user_found, class_name: 'User', foreign_key: 'user_found_id'
  belongs_to :user_lost, class_name: 'User', foreign_key: 'user_lost_id'
  mount_uploader :photo, DogImageUploader

end
