require 'test_helper'

class CheatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cheating = cheatings(:one)
  end

  test "should get index" do
    get cheatings_url
    assert_response :success
  end

  test "should get new" do
    get new_cheating_url
    assert_response :success
  end

  test "should create cheating" do
    assert_difference('Cheating.count') do
      post cheatings_url, params: { cheating: {  } }
    end

    assert_redirected_to cheating_url(Cheating.last)
  end

  test "should show cheating" do
    get cheating_url(@cheating)
    assert_response :success
  end

  test "should get edit" do
    get edit_cheating_url(@cheating)
    assert_response :success
  end

  test "should update cheating" do
    patch cheating_url(@cheating), params: { cheating: {  } }
    assert_redirected_to cheating_url(@cheating)
  end

  test "should destroy cheating" do
    assert_difference('Cheating.count', -1) do
      delete cheating_url(@cheating)
    end

    assert_redirected_to cheatings_url
  end
end
