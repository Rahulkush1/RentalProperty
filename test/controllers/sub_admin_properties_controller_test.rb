require "test_helper"

class SubAdminPropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sub_admin_properties_index_url
    assert_response :success
  end

  test "should get show" do
    get sub_admin_properties_show_url
    assert_response :success
  end
end
