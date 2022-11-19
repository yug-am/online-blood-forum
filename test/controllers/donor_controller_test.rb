require "test_helper"

class DonorControllerTest < ActionDispatch::IntegrationTest
  test "should get donor_home" do
    get donor_donor_home_url
    assert_response :success
  end
end
