require 'test_helper'

class FokeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fokey = fokeys(:one)
  end

  test "should get index" do
    get fokeys_url
    assert_response :success
  end

  test "should get new" do
    get new_fokey_url
    assert_response :success
  end

  test "should create fokey" do
    assert_difference('Fokey.count') do
      post fokeys_url, params: { fokey: {  } }
    end

    assert_redirected_to fokey_url(Fokey.last)
  end

  test "should show fokey" do
    get fokey_url(@fokey)
    assert_response :success
  end

  test "should get edit" do
    get edit_fokey_url(@fokey)
    assert_response :success
  end

  test "should update fokey" do
    patch fokey_url(@fokey), params: { fokey: {  } }
    assert_redirected_to fokey_url(@fokey)
  end

  test "should destroy fokey" do
    assert_difference('Fokey.count', -1) do
      delete fokey_url(@fokey)
    end

    assert_redirected_to fokeys_url
  end
end
