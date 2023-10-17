require "test_helper"

class AppointmentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get appointment_new_url
    assert_response :success
  end

  test "should get create" do
    get appointment_create_url
    assert_response :success
  end
end
