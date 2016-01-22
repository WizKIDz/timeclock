# == Schema Information
#
# Table name: timekeepings
#
#  id         :integer          not null, primary key
#  clock_in   :datetime
#  clock_out  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

require 'test_helper'

class TimekeepingsControllerTest < ActionController::TestCase
  setup do
    @timekeeping = timekeepings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timekeepings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timekeeping" do
    assert_difference('Timekeeping.count') do
      post :create, timekeeping: { clock_in: @timekeeping.clock_in, clock_out: @timekeeping.clock_out }
    end

    assert_redirected_to timekeeping_path(assigns(:timekeeping))
  end

  test "should show timekeeping" do
    get :show, id: @timekeeping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timekeeping
    assert_response :success
  end

  test "should update timekeeping" do
    patch :update, id: @timekeeping, timekeeping: { clock_in: @timekeeping.clock_in, clock_out: @timekeeping.clock_out }
    assert_redirected_to timekeeping_path(assigns(:timekeeping))
  end

  test "should destroy timekeeping" do
    assert_difference('Timekeeping.count', -1) do
      delete :destroy, id: @timekeeping
    end

    assert_redirected_to timekeepings_path
  end
end
