require "application_system_test_case"

class TripFilesTest < ApplicationSystemTestCase
  setup do
    @trip_file = trip_files(:one)
  end

  test "visiting the index" do
    visit trip_files_url
    assert_selector "h1", text: "Trip Files"
  end

  test "creating a Trip file" do
    visit trip_files_url
    click_on "New Trip File"

    click_on "Create Trip file"

    assert_text "Trip file was successfully created"
    click_on "Back"
  end

  test "updating a Trip file" do
    visit trip_files_url
    click_on "Edit", match: :first

    click_on "Update Trip file"

    assert_text "Trip file was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip file" do
    visit trip_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip file was successfully destroyed"
  end
end
