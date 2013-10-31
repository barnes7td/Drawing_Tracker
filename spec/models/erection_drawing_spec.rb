require 'spec_helper'

describe ErectionDrawing do
  let(:area) { FactoryGirl.create(:area) }
  let(:erection_drawing) { FactoryGirl.create(:erection_drawing) }

  it "creates a drawing number with revision" do
    erection_drawing = FactoryGirl.create(:erection_drawing, number: "4002", revision: 2)
    expect(erection_drawing.name).to eq("4002-2")
    erection_drawing = FactoryGirl.create(:erection_drawing, number: "3257", revision: 3)
    expect(erection_drawing.name).to eq("3257-3")
  end

  # it "is associated to an area" do
  #   expect(erection_drawing.area).to_not be(nil)
  #   #
  # end
end
