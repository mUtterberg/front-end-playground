require "application_system_test_case"

class WhiskeysTest < ApplicationSystemTestCase
  setup do
    @whiskey = whiskeys(:one)
  end

  test "visiting the index" do
    visit whiskeys_url
    assert_selector "h1", text: "Whiskeys"
  end

  test "creating a Whiskey" do
    visit whiskeys_url
    click_on "New Whiskey"

    fill_in "Abv", with: @whiskey.abv
    fill_in "Brand", with: @whiskey.brand
    fill_in "Name", with: @whiskey.name
    fill_in "Type", with: @whiskey.type
    click_on "Create Whiskey"

    assert_text "Whiskey was successfully created"
    click_on "Back"
  end

  test "updating a Whiskey" do
    visit whiskeys_url
    click_on "Edit", match: :first

    fill_in "Abv", with: @whiskey.abv
    fill_in "Brand", with: @whiskey.brand
    fill_in "Name", with: @whiskey.name
    fill_in "Type", with: @whiskey.type
    click_on "Update Whiskey"

    assert_text "Whiskey was successfully updated"
    click_on "Back"
  end

  test "destroying a Whiskey" do
    visit whiskeys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Whiskey was successfully destroyed"
  end
end
