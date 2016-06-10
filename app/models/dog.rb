class Dog < ActiveRecord::Base
  belongs_to :raza
  belongs_to :user_found, class_name: 'User', foreign_key: 'user_found_id'
  belongs_to :user_lost, class_name: 'User', foreign_key: 'user_lost_id'
  belongs_to :user
  validates_associated :user
  mount_uploader :photo, DogImageUploader
  validates_presence_of  :raza, :codigoPostal, :ciudad, :pais

  geocoded_by :address
  after_validation :geocode

  def address
  	[calle, numero, colonia, ciudad, pais, codigoPostal].compact.join(' , ')
  end

end
