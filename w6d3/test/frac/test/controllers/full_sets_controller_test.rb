require 'test_helper'

class FullSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @full_set = full_sets(:one)
  end

  test "should get index" do
    get full_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_full_set_url
    assert_response :success
  end

  test "should create full_set" do
    assert_difference('FullSet.count') do
      post full_sets_url, params: { full_set: {  } }
    end

    assert_redirected_to full_set_url(FullSet.last)
  end

  test "should show full_set" do
    get full_set_url(@full_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_full_set_url(@full_set)
    assert_response :success
  end

  test "should update full_set" do
    patch full_set_url(@full_set), params: { full_set: {  } }
    assert_redirected_to full_set_url(@full_set)
  end

  test "should destroy full_set" do
    assert_difference('FullSet.count', -1) do
      delete full_set_url(@full_set)
    end

    assert_redirected_to full_sets_url
  end
end
