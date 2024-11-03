require "application_system_test_case"

class QoutesTest < ApplicationSystemTestCase

  setup do 
    @qoute = qoutes(:first) 
  end

  test "Creating a new Qoute" do
    visit qoutes_url
    assert_selector "h1", text: "Qoutes"
    click_on "New qoute"
    assert_selector "h1", text: "New qoute"
    fill_in "Name", with: "Capybara qoute"
    click_on "Create Qoute"
    assert_selector "h1", text: "Qoutes"
    assert_text "Capybara qoute"
  end

  test "Showing a qoute" do 
    visit qoutes_path
    click_link @qoute.name
    assert_selector "h1", text: @qoute.name
  end

  test "Updating a qoute" do 
    visit qoutes_path
    assert_selector "h1", text: "Qoutes"
    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit qoute"
    fill_in "Name", with: "Updated Qoute"
    click_on "Update Qoute"
    assert_selector "h1", text: "Qoutes"
    assert_text "Updated Qoute"
  end

  test "Destroying a qoute" do 
    visit qoutes_path
    assert_text @qoute.name
    click_on "Delete", match: :first
    assert_no_text @qoute.name
  end

end
