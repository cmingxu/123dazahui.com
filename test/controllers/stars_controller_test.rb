require 'test_helper'

class StarsControllerTest < ActionController::TestCase
  setup do
    @star = stars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create star" do
    assert_difference('Star.count') do
      post :create, star: { achievement: @star.achievement, blood: @star.blood, career: @star.career, company: @star.company, constellation: @star.constellation, country: @star.country, desc: @star.desc, desc_short: @star.desc_short, dob: @star.dob, event: @star.event, gender: @star.gender, height: @star.height, hobby: @star.hobby, home_town: @star.home_town, name: @star.name, rate: @star.rate, religon: @star.religon, school: @star.school, source: @star.source, weight: @star.weight }
    end

    assert_redirected_to star_path(assigns(:star))
  end

  test "should show star" do
    get :show, id: @star
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @star
    assert_response :success
  end

  test "should update star" do
    patch :update, id: @star, star: { achievement: @star.achievement, blood: @star.blood, career: @star.career, company: @star.company, constellation: @star.constellation, country: @star.country, desc: @star.desc, desc_short: @star.desc_short, dob: @star.dob, event: @star.event, gender: @star.gender, height: @star.height, hobby: @star.hobby, home_town: @star.home_town, name: @star.name, rate: @star.rate, religon: @star.religon, school: @star.school, source: @star.source, weight: @star.weight }
    assert_redirected_to star_path(assigns(:star))
  end

  test "should destroy star" do
    assert_difference('Star.count', -1) do
      delete :destroy, id: @star
    end

    assert_redirected_to stars_path
  end
end
