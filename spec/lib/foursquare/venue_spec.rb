require 'spec_helper'

describe Foursquare::Venue do
  
  before(:each) do
    allow(foursquare).to receive(:get).with("venues/4ab7e57cf964a5205f7b20e3").and_return(JSON.parse(get_file("spec/fixtures/venues/foursquarehq.json")))
    @foursquarehq = foursquare.venues.find('4ab7e57cf964a5205f7b20e3')
    
    # without categories
    allow(foursquare).to receive(:get).with("venues/4d8642e540a7a35d028831be").and_return(JSON.parse(get_file("spec/fixtures/venues/khloe.json")))
    @khloe = foursquare.venues.find('4d8642e540a7a35d028831be')
  end
  
  describe "Atomical Attributes" do 

    it "should get an id" do
      expect(@foursquarehq.id).to eql("4ab7e57cf964a5205f7b20e3")
      expect(@khloe.id).to eql("4d8642e540a7a35d028831be")
    end
    
    it "should get a name" do
      expect(@foursquarehq.name).to eql("foursquare HQ")
    end
    
    it "should get a twitter handle" do
      expect(@foursquarehq.twitter).to eql('foursquare')
    end
    
    it "should get a location" do
      expect(@foursquarehq.location).not_to be_falsey
    end
    
    it "should get a category" do
      @foursquarehq.categories.first.name == "Tech Startup"
    end
    
    it "should be verified" do
      expect(@foursquarehq.verified?).to be_truthy
    end
    
    it "should have an icon" do
      expect(@foursquarehq.icon.url).to eql("https://foursquare.com/img/categories/building/default_32.png")
    end
    
    it "should have a default icon" do
      expect(@khloe.icon.url).to eql("https://foursquare.com/img/categories/none_32.png")
    end
    
    it "should have 273 photos" do
      expect(@foursquarehq.photos_count).to eql(273)
    end
    
    it "shoud have all the photos" do
      expect(@foursquarehq.photos.count).to eql(6)
    end
    
    it "should have tips" do
      pending
    end
    
    it "should have here_now count" do
      pending
    end
    
    it "should have here_now checkins" do
      pending
    end
    
  end
  
  describe "Composed Attributes" do
    it "should fetch photos" do
    end
  end
  
end