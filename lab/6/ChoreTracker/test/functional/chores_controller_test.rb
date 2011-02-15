require 'test_helper'

class ChoresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Chore.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Chore.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Chore.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to chore_url(assigns(:chore))
  end

  def test_edit
    get :edit, :id => Chore.first
    assert_template 'edit'
  end

  def test_update_invalid
    Chore.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Chore.first
    assert_template 'edit'
  end

  def test_update_valid
    Chore.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Chore.first
    assert_redirected_to chore_url(assigns(:chore))
  end

  def test_destroy
    chore = Chore.first
    delete :destroy, :id => chore
    assert_redirected_to chores_url
    assert !Chore.exists?(chore.id)
  end
end
