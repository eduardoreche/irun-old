require File.dirname(__FILE__) + '/../test_helper'

class DevelopersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:developers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_developer
    assert_difference('Developer.count') do
      post :create, :developer => { }
    end

    assert_redirected_to developer_path(assigns(:developer))
  end

  def test_should_show_developer
    get :show, :id => developers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => developers(:one).id
    assert_response :success
  end

  def test_should_update_developer
    put :update, :id => developers(:one).id, :developer => { }
    assert_redirected_to developer_path(assigns(:developer))
  end

  def test_should_destroy_developer
    assert_difference('Developer.count', -1) do
      delete :destroy, :id => developers(:one).id
    end

    assert_redirected_to developers_path
  end
end
