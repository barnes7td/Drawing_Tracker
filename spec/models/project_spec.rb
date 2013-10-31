require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }

  it "has a name" do
    expect(project.name).to eq("Croton")
  end

  it "has a number" do
    expect(project.number).to eq("208-05-09")
  end

  # it "adds drawings to itself"
  #   project = FactoryGirl.create(:project)
  #   drawings = %w[ 1 2 3 4 ]
  #   expect(project.add_drawings(drawings)).
    
  # end
end
