require 'test_helper'

class EntsControllerTest < ActionController::TestCase
  setup do
    @ent = ents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ent" do
    assert_difference('Ent.count') do
      post :create, ent: { author: @ent.author, desc: @ent.desc, link: @ent.link, pub: @ent.pub, title: @ent.title }
    end

    assert_redirected_to ent_path(assigns(:ent))
  end

  test "should show ent" do
    get :show, id: @ent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ent
    assert_response :success
  end

  test "should update ent" do
    patch :update, id: @ent, ent: { author: @ent.author, desc: @ent.desc, link: @ent.link, pub: @ent.pub, title: @ent.title }
    assert_redirected_to ent_path(assigns(:ent))
  end

  test "should destroy ent" do
    assert_difference('Ent.count', -1) do
      delete :destroy, id: @ent
    end

    assert_redirected_to ents_path
  end
end
