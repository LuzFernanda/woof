json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :gender, :raza_id, :latitude, :longitude, :dateFound, :dateLost, :characteristics, :collar, :reward, :photo, :user_found_id, :user_lost_id
  json.url dog_url(dog, format: :json)
end
