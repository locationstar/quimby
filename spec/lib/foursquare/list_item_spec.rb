require "spec_helper"

describe Foursquare::ListItem do

  before(:each) do
    @json = JSON.parse(get_file("spec/fixtures/lists/list/item.json"))
    @item = Foursquare::ListItem.new(foursquare, @json)
  end
  
  describe "Atomic Attributes" do
    
    it "should have a venue" do
      expect(@item.venue).not_to be_nil
      expect(@item.venue.id).to eql("43695300f964a5208c291fe3")
    end
    
    it "should have a tip?" do
      expect(@item.tip?).to be_truthy
    end
    
    it "should have a tip text" do
      expect(@item.tip.text).to eql("my first tip")
    end
    
    it "should have a photo?" do
      expect(@item.photo?).to be_truthy
    end
    
    it "should have a photo id" do
      expect(@item.photo.id).to eql('4ed3af6ab8f7971d6e75396e')
    end
    
    it "should have been created at 1322601499" do
      expect(@item.created_at.to_i).to eql(1322601499)
    end
    
    it "should not wanted to be done" do
      expect(@item.todo?).to be_falsey
    end
    
    it "should be done" do
      expect(@item.done?).to be_truthy
    end
    
    it "should have visited by 0 people" do
      expect(@item.visited_count).to eql(0)
    end
    
  end
  
  describe "Composed Attributes" do
    
    it "should have an user" do
      expect(@item.user).not_to be_nil
    end
    
  end
  
end