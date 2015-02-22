require 'spec_helper'

describe Foursquare::ExploreResult do
  
  before(:each) do
    @json = JSON.parse(get_file("spec/fixtures/venues/explore/venues.json"))
    @result = Foursquare::ExploreResult.new(foursquare, @json)
  end

  describe "Explore result" do
    
    it "should have keywords" do
      expect(@result.keywords).not_to be_blank
    end
    
    it "should have 30 keywords" do
      expect(@result.keywords.count).to eql(30)
    end
    
    it "should have groups" do
      expect(@result.groups).not_to be_blank
    end
    
    it "should have a recommended group" do
      expect(@result.groups['recommended']).not_to be_blank
    end
    
    it "should have only a recommended group" do
      expect(@result.groups.keys).to eql(["recommended"])
    end
    
    it "should have a recommended group that has items" do
      expect(@result.groups['recommended']['items']).not_to be_blank
    end
    
  end
  
end