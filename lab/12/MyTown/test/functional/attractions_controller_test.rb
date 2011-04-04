require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Attraction.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Attraction.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Attraction.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to attraction_url(assigns(:attraction))
  end

  def test_edit
    get :edit, :id => Attraction.first
    assert_template 'edit'
  end

  def test_update_invalid
    Attraction.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Attraction.first
    assert_template 'edit'
  end

  def test_update_valid
    Attraction.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Attraction.first
    assert_redirected_to attraction_url(assigns(:attraction))
  end

  def test_destroy
    attraction = Attraction.first
    delete :destroy, :id => attraction
    assert_redirected_to attractions_url
    assert !Attraction.exists?(attraction.id)
  end
end
