require 'spec_helper'

describe Foursquare::Icon do
  
  describe "Venue Icon" do
    
    it "should have a default url" do
      expect(Foursquare::Icon.venue.url).to eql('https://foursquare.com/img/categories/none_32.png')
    end
    
  end
  
end