require 'test_helper'

class ClazzsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clazz = clazzs(:one)
  end

  test "should get index" do
    get clazzs_url
    assert_response :success
  end

  test "should get new" do
    get new_clazz_url
    assert_response :success
  end

  test "should create clazz" do
    assert_difference('Clazz.count') do
      post clazzs_url, params: { clazz: { id_clazz: @clazz.id_clazz, id_department: @clazz.id_department, level: @clazz.level } }
    end

    assert_redirected_to clazz_url(Clazz.last)
  end

  test "should show clazz" do
    get clazz_url(@clazz)
    assert_response :success
  end

  test "should get edit" do
    get edit_clazz_url(@clazz)
    assert_response :success
  end

  test "should update clazz" do
    patch clazz_url(@clazz), params: { clazz: { id_clazz: @clazz.id_clazz, id_department: @clazz.id_department, level: @clazz.level } }
    assert_redirected_to clazz_url(@clazz)
  end

  test "should destroy clazz" do
    assert_difference('Clazz.count', -1) do
      delete clazz_url(@clazz)
    end

    assert_redirected_to clazzs_url
  end
end
