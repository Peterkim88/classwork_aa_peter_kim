require "application_system_test_case"

class CheatingsTest < ApplicationSystemTestCase
  setup do
    @cheating = cheatings(:one)
  end

  test "visiting the index" do
    visit cheatings_url
    assert_selector "h1", text: "Cheatings"
  end

  test "creating a Cheating" do
    visit cheatings_url
    click_on "New Cheating"

    click_on "Create Cheating"

    assert_text "Cheating was successfully created"
    click_on "Back"
  end

  test "updating a Cheating" do
    visit cheatings_url
    click_on "Edit", match: :first

    click_on "Update Cheating"

    assert_text "Cheating was successfully updated"
    click_on "Back"
  end

  test "destroying a Cheating" do
    visit cheatings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cheating was successfully destroyed"
  end
end
