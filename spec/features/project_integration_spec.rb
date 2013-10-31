require 'spec_helper'

describe "User should be able to see all Projects at the index" do

  it "works" do
    visit '/'

    expect(page).to have_content("Projects")
  end
end