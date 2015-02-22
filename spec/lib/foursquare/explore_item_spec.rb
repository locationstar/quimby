require 'spec_helper'

describe Foursquare::ExploreItem do
  
  before(:each) do
    @json = JSON.parse(get_file("spec/fixtures/venues/explore/venues.json"))
    @result = Foursquare::ExploreResult.new(foursquare, @json)
    @item = @result.groups['recommended']['items'].first
  end

  describe "Explore result" do
    
    it "should have reasons" do
      expect(@item.reasons).not_to be_blank
    end
    
    it "should have a good reason" do
      expect(@item.reasons.first['message']).to eql('A lot of people talk about this place')
    end
    
    it "should have a venue" do
      expect(@item.venue).not_to be_blank
    end
    
    it "should have a correct venue" do
      expect(@item.venue.name).to eql("Grimaldi's Pizzeria")
    end
    
    it "should have tips" do
      expect(@item.tips).not_to be_blank
    end
    
    it "should have a correct tip" do
      expect(@item.tips.first.id).to eql("4c62b64eedb29c74df3a2ca7")
    end
    
  end
  
end