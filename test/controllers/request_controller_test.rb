require "test_helper"

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "should get req" do
    get request_req_url
    assert_response :success
  end
end
