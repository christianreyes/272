require 'test_helper'

class TownsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Town.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Town.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Town.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to town_url(assigns(:town))
  end

  def test_edit
    get :edit, :id => Town.first
    assert_template 'edit'
  end

  def test_update_invalid
    Town.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Town.first
    assert_template 'edit'
  end

  def test_update_valid
    Town.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Town.first
    assert_redirected_to town_url(assigns(:town))
  end

  def test_destroy
    town = Town.first
    delete :destroy, :id => town
    assert_redirected_to towns_url
    assert !Town.exists?(town.id)
  end
end
