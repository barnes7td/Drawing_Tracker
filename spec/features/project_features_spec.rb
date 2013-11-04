require 'spec_helper'
require 'faker'


feature "User can view all the projects that exist" do
  before do
    Project.create( name: "Chicago", number: "213-01-03")
    Project.create( name: "Dallas",  number: "212-12-07")
  end

  scenario "when User goes to the root directory" do
    visit '/'
    expect(page).to have_content("Projects")
  end
end

feature "User can see Project info" do
  before do
    Project.create( name: "Chicago", number: "213-01-03")
    Project.create( name: "Dallas",  number: "212-12-07")
  end

  scenario "when User clicks on the Name of the Project" do
    visit '/'
    click_link 'Dallas'
    expect(page).to have_content("212-12-07")
  end
end

feature "User can see all Drawings" do
  before do
    Project.create( name: "Chicago", number: "213-01-03")
    Project.create( name: "Dallas",  number: "212-12-07")
  end

  scenario "when User visits the Project show page" do
    Project.find(2).drawings.create(number: "2")
    Project.find(2).drawings.create(number: "7")
    Project.find(2).drawings.create(number: "13")
    visit "/projects/2/"
    expect(page).to have_content("2")
    expect(page).to have_content("7")
    expect(page).to have_content("13")
    expect(page).to_not have_content("5")
  end
end

feature "User can see Drawing statuses" do
  before do
    Project.create( name: "Chicago", number: "213-01-03")
    Project.create( name: "Dallas",  number: "212-12-07")
  end

  scenario "when User visits the Project show page" do
    Project.find(2).drawings.create(number: "2", status: "Release")
    Project.find(2).drawings.create(number: "7", status: "Complete")
    Project.find(2).drawings.create(number: "13", status: "Release")
    visit "/projects/2/"
    expect(page).to have_content("Release")
    expect(page).to have_content("Complete")
  end
end

feature "User can add drawings to Project" do
  before do
    project = Project.create( name: "Dallas",  number: "999-99-99")
    project.drawings.create(number: "2", status: "Release")
    visit "/projects/1/"
  end

  scenario "when User inputs 1 drawing name" do
    fill_in "drawings", with: "3"
    fill_in "status",   with: "Complete"

    click_button "Update"

    expect(page).to have_content("Complete")
  end

  scenario "when User inputs multiple drawings separated by a comma (3,4)" do
    fill_in "drawings", with: "3,4"
    fill_in "status",   with: "Complete"

    click_button "Update"

    expect(page).to have_content("3")
    expect(page).to have_content("4")
    expect(page).to_not have_content("3,4")
    expect(page).to have_content("Complete")
  end

  scenario "when User inputs multiple drawings separated by a hyphen (3-6)" do
    fill_in "drawings", with: "3-6"
    fill_in "status",   with: "Complete"

    click_button "Update"

    expect(page).to have_content("3")
    expect(page).to have_content("4")
    expect(page).to have_content("5")
    expect(page).to have_content("6")
    expect(page).to_not have_content("3-6")
    expect(page).to have_content("Complete")
  end

  scenario "when User inputs multiple drawings separated by a comma and a hyphen (1, 3-6)" do
    fill_in "drawings", with: "1,3-6"
    fill_in "status",   with: "Complete"

    click_button "Update"

    expect(page).to have_content("1")
    expect(page).to have_content("3")
    expect(page).to have_content("4")
    expect(page).to have_content("5")
    expect(page).to have_content("6")
    expect(page).to_not have_content("3-6")
    expect(page).to have_content("Complete")

    # save_and_open_pages
  end
end

feature "User can delete drawings from the Project" do
  scenario "when User is on the Project show page" do
    project = Project.create( name: "Dallas",  number: "212-12-07")
    project.drawings.create(number: "9", status: "Complete")
    project.drawings.create(number: "3", status: "Release")

    visit "/projects/1/"

    click_link "drawing-delete-1"

    expect(page).to_not have_content("9")
    expect(page).to_not have_content("Complete")
  end
end

feature "User can update the status of a drawing" do
  scenario "when user fills in a drawing name that exists and a new status" do
    project = Project.create( name: "Dallas",  number: "212-12-07")
    project.drawings.create(number: "9", status: "release")

    visit "/projects/1/"

    fill_in "drawings", with: "9"
    fill_in "status",   with: "finished"

    click_button "Update"

    expect(page).to have_content("finished")
    expect(page).to_not have_content("release")
  end
end





