require 'test_helper'

class TotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toto = totos(:one)
  end

  test "should get index" do
    get totos_url
    assert_response :success
  end

  test "should get new" do
    get new_toto_url
    assert_response :success
  end

  test "should create toto" do
    assert_difference('Toto.count') do
      post totos_url, params: { toto: {  } }
    end

    assert_redirected_to toto_url(Toto.last)
  end

  test "should show toto" do
    get toto_url(@toto)
    assert_response :success
  end

  test "should get edit" do
    get edit_toto_url(@toto)
    assert_response :success
  end

  test "should update toto" do
    patch toto_url(@toto), params: { toto: {  } }
    assert_redirected_to toto_url(@toto)
  end

  test "should destroy toto" do
    assert_difference('Toto.count', -1) do
      delete toto_url(@toto)
    end

    assert_redirected_to totos_url
  end
end
