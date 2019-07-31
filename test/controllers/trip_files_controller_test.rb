require 'test_helper'

class TripFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_file = trip_files(:one)
  end

  test "should get index" do
    get trip_files_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_file_url
    assert_response :success
  end

  test "should create trip_file" do
    assert_difference('TripFile.count') do
      post trip_files_url, params: { trip_file: {  } }
    end

    assert_redirected_to trip_file_url(TripFile.last)
  end

  test "should show trip_file" do
    get trip_file_url(@trip_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_file_url(@trip_file)
    assert_response :success
  end

  test "should update trip_file" do
    patch trip_file_url(@trip_file), params: { trip_file: {  } }
    assert_redirected_to trip_file_url(@trip_file)
  end

  test "should destroy trip_file" do
    assert_difference('TripFile.count', -1) do
      delete trip_file_url(@trip_file)
    end

    assert_redirected_to trip_files_url
  end
end
