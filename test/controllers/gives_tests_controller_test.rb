require 'test_helper'

class GivesTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gives_test = gives_tests(:one)
  end

  test "should get index" do
    get gives_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_gives_test_url
    assert_response :success
  end

  test "should create gives_test" do
    assert_difference('GivesTest.count') do
      post gives_tests_url, params: { gives_test: {  } }
    end

    assert_redirected_to gives_test_url(GivesTest.last)
  end

  test "should show gives_test" do
    get gives_test_url(@gives_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_gives_test_url(@gives_test)
    assert_response :success
  end

  test "should update gives_test" do
    patch gives_test_url(@gives_test), params: { gives_test: {  } }
    assert_redirected_to gives_test_url(@gives_test)
  end

  test "should destroy gives_test" do
    assert_difference('GivesTest.count', -1) do
      delete gives_test_url(@gives_test)
    end

    assert_redirected_to gives_tests_url
  end
end
