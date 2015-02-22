require 'spec_helper'

describe Foursquare::List do
  
  before(:each) do
    allow(foursquare).to receive(:get).with("lists/4ed53e79722e6f1fdabeae6f").and_return(JSON.parse(get_file("spec/fixtures/lists/4ed53e79722e6f1fdabeae6f.json")))
    @list = foursquare.lists.find("4ed53e79722e6f1fdabeae6f")
  end
  
  describe "Atomical Attributes" do 

    it "should get an id" do
      expect(@list.id).to eql("4ed53e79722e6f1fdabeae6f") 
    end

    it "should get a name" do
      expect(@list.name).to eql("My First List") 
    end
    
    it "should get a description" do
      expect(@list.description).to eql("my description") 
    end

    it "should not be editable" do
      expect(@list.editable?).to eql(true) 
    end
    
    it "should not be collaborative" do
      expect(@list.collaborative?).to eql(false) 
    end

    it "should get canonicalUrl" do
      expect(@list.canonical_url).to eql("https://foursquare.com/user/17409817/list/my-first-list") 
    end
    
    it "should get done count" do
      expect(@list.done_count).to eql(0) 
    end
    
    it "should get visited count" do
      expect(@list.visited_count).to eql(0) 
    end
    
    it "should have 2 venues" do
      expect(@list.venue_count).to eql(2) 
    end

    
    it "should not get photo" do
     expect(@list.photo).not_to be_nil
    end
    
    it "should have no followers" do
      expect(@list.followers?).to be_falsey
    end
    
  end

  describe "Composed Attributes" do
    
    it "should have a user" do
      expect(@list.user.first_name).to eql("Quimby")
      expect(@list.user.last_name).to eql("API")
    end
    
    it "should have 0 followers" do
      expect(@list.followers.size).to eq(0)
    end
    
    it "should have 0 collaborators" do
      expect(@list.collaborators.size).to eq(0)
    end
    
    it "should have 2 items" do
      expect(@list.list_items.size).to eq(2)
      expect(@list.list_items[0].id).to eql("v43695300f964a5208c291fe3")
      expect(@list.list_items[1].id).to eql("v4a2fc4d3f964a520da981fe3")
    end
    
  end
  
end