require 'spec_helper'

describe Project do
  it "has a name" do
    FactoryGirl.create(:project, name: "Rohurst").name.should eq("Rohurst")
  end

  # it "has a name" do
  #   FactoryGirl.create(:project, name: "Rohurst").should eq("Rohurst")
  # end
end
