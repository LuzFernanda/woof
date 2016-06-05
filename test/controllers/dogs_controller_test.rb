require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  setup do
    @dog = dogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Dog.count') do
      post :create, dog: { characteristics: @dog.characteristics, collar: @dog.collar, dateFound: @dog.dateFound, dateLost: @dog.dateLost, gender: @dog.gender, latitude: @dog.latitude, longitude: @dog.longitude, name: @dog.name, photo: @dog.photo, raza_id: @dog.raza_id, reward: @dog.reward, user_found_id: @dog.user_found_id, user_lost_id: @dog.user_lost_id }
    end

    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should show dog" do
    get :show, id: @dog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dog
    assert_response :success
  end

  test "should update dog" do
    patch :update, id: @dog, dog: { characteristics: @dog.characteristics, collar: @dog.collar, dateFound: @dog.dateFound, dateLost: @dog.dateLost, gender: @dog.gender, latitude: @dog.latitude, longitude: @dog.longitude, name: @dog.name, photo: @dog.photo, raza_id: @dog.raza_id, reward: @dog.reward, user_found_id: @dog.user_found_id, user_lost_id: @dog.user_lost_id }
    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should destroy dog" do
    assert_difference('Dog.count', -1) do
      delete :destroy, id: @dog
    end

    assert_redirected_to dogs_path
  end
end
