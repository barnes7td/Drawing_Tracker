require "spec_helper"

feature "User views all drawings" do
  scenario "all cases" do
    visit drawings_path

    expect(page).to have_content("Erection Drawings")
    expect(page).to have_content("Piece Drawings")
  end
end

feature "User can see drawing page" do
  scenario "all cases" do
    ErectionDrawing.create(number: "1", revision: 3)
    visit drawing_path(1)

    expect(page).to have_content("Area")
    expect(page).to have_content("Batch Number")
  end
end

