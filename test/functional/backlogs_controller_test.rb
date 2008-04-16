require File.dirname(__FILE__) + '/../test_helper'

class BacklogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:backlogs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_backlog
    assert_difference('Backlog.count') do
      post :create, :backlog => { }
    end

    assert_redirected_to backlog_path(assigns(:backlog))
  end

  def test_should_show_backlog
    get :show, :id => backlogs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => backlogs(:one).id
    assert_response :success
  end

  def test_should_update_backlog
    put :update, :id => backlogs(:one).id, :backlog => { }
    assert_redirected_to backlog_path(assigns(:backlog))
  end

  def test_should_destroy_backlog
    assert_difference('Backlog.count', -1) do
      delete :destroy, :id => backlogs(:one).id
    end

    assert_redirected_to backlogs_path
  end
end
