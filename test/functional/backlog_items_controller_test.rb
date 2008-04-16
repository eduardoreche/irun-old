require File.dirname(__FILE__) + '/../test_helper'

class BacklogItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:backlog_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_backlog_item
    assert_difference('BacklogItem.count') do
      post :create, :backlog_item => { }
    end

    assert_redirected_to backlog_item_path(assigns(:backlog_item))
  end

  def test_should_show_backlog_item
    get :show, :id => backlog_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => backlog_items(:one).id
    assert_response :success
  end

  def test_should_update_backlog_item
    put :update, :id => backlog_items(:one).id, :backlog_item => { }
    assert_redirected_to backlog_item_path(assigns(:backlog_item))
  end

  def test_should_destroy_backlog_item
    assert_difference('BacklogItem.count', -1) do
      delete :destroy, :id => backlog_items(:one).id
    end

    assert_redirected_to backlog_items_path
  end
end
