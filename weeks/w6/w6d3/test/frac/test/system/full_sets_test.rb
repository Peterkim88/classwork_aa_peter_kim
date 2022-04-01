require "application_system_test_case"

class FullSetsTest < ApplicationSystemTestCase
  setup do
    @full_set = full_sets(:one)
  end

  test "visiting the index" do
    visit full_sets_url
    assert_selector "h1", text: "Full Sets"
  end

  test "creating a Full set" do
    visit full_sets_url
    click_on "New Full Set"

    click_on "Create Full set"

    assert_text "Full set was successfully created"
    click_on "Back"
  end

  test "updating a Full set" do
    visit full_sets_url
    click_on "Edit", match: :first

    click_on "Update Full set"

    assert_text "Full set was successfully updated"
    click_on "Back"
  end

  test "destroying a Full set" do
    visit full_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Full set was successfully destroyed"
  end
end
