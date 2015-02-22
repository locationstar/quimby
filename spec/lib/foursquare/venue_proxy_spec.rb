require 'spec_helper'

describe Foursquare::VenueProxy do

  before(:each) do
    allow(foursquare).to receive(:get).with("venues/trending", {:ll => '40.7,-74'}).and_return(JSON.parse(get_file("spec/fixtures/venues/trending/venues.json")))
  end

  describe "Proxy Methods" do

    it "should not find a venue without a id" do
      expect { foursquare.venues.find() }.to raise_error(ArgumentError)
    end

    it "should search for a venue" do
      allow(foursquare).to receive(:get).with("venues/4ab7e57cf964a5205f7b20e3").and_return(JSON.parse(get_file("spec/fixtures/venues/foursquarehq.json")))
      expect(foursquare.venues.find('4ab7e57cf964a5205f7b20e3').id).to eql('4ab7e57cf964a5205f7b20e3')
    end

    it "should include a :ll options in order to make a search" do
      expect { foursquare.venues.search() }.to raise_error(ArgumentError)
    end

    it "should search for venues around the user (for checkin)" do
      allow(foursquare).to receive(:get).with("venues/search", {:ll => '40.7,-74'}).and_return(JSON.parse(get_file("spec/fixtures/venues/search/venues.json")))
      expect(foursquare.venues.search(:ll => '40.7,-74').first.id).to eql("4eaf053bf5b99d2425f5bfa1")
    end

    it "should have a explore method" do
      allow(foursquare).to receive(:get).with("venues/explore", {:ll => '40.7,-74'}).and_return(JSON.parse(get_file("spec/fixtures/venues/explore/venues.json")))
      expect(foursquare.venues.explore(:ll => '40.7,-74').class).to eql(Foursquare::ExploreResult)
    end

    it "should ask for a location when asking for trending venues" do
      expect { foursquare.venues.trending() }.to raise_error(ArgumentError)
    end

    it "should give 9 trendings venues" do
      expect(foursquare.venues.trending(:ll => '40.7,-74').count).to eql(9)
    end

    it "should give you MTA Subway - Manhattan Bridge (B/D/N/Q) as the first trending venue" do
      expect(foursquare.venues.trending(:ll => '40.7,-74').first.name).to eql('MTA Subway - Manhattan Bridge (B/D/N/Q)')
    end

  end
end