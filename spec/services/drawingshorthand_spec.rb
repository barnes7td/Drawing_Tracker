require_relative "../../app/services/drawingshorthand.rb"

describe Drawingshorthand do
  it "decrypts a single drawing" do
    expect(Drawingshorthand.decrypt("1")).to eq(["1"])
  end

  context "given 2 drawings separated by a comma" do
    it "decrypts when there are no spaces" do
      expect(Drawingshorthand.decrypt("1,2")).to eq(["1", "2"])
    end

    it "decrypts when there are spaces" do
      expect(Drawingshorthand.decrypt("1,  2")).to eq(["1", "2"])
    end

    it "decrypts when there are 2 digit numbers" do
      expect(Drawingshorthand.decrypt("24,26")).to eq(["24", "26"])
    end
  end

  context "given 2 drawings separated by a hyphen" do
    it "decrypts when there are no spaces" do
      expect(Drawingshorthand.decrypt("1-3")).to eq(["1", "2", "3"])
    end

    it "decrypts when there are spaces" do
      expect(Drawingshorthand.decrypt("1- 3")).to eq(["1", "2", "3"])
    end

    it "decrypts when there are 2 digit numbers" do
      expect(Drawingshorthand.decrypt("24-26")).to eq(["24", "25", "26"])
    end
  end

  context "given multiple drawings separated by a hyphen and comma" do
    it "decrypts when there are no spaces" do
      expect(Drawingshorthand.decrypt("1-3,5")).to eq(["1", "2", "3", "5"])
    end

    it "decrypts when there are spaces" do
      expect(Drawingshorthand.decrypt("1-3,  5")).to eq(["1", "2", "3", "5"])
    end

    it "decrypts when there are comma,hypen,comma" do
      expect(Drawingshorthand.decrypt("1,3-5,7")).to eq(["1", "3", "4", "5", "7"])
    end

    it "decrypts when there are 2 digit numbers" do
      expect(Drawingshorthand.decrypt("22,24-26")).to eq(["22", "24", "25", "26"])
    end
  end
end
