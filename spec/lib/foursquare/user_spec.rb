require 'spec_helper'

describe Foursquare::User do
  
  before(:each) do
    @user = current_user
    
    # lists
    allow(foursquare).to receive(:get).with("users/17409817/lists", {:group => 'created'}).and_return(JSON.parse(get_file("spec/fixtures/users/lists/created.json")))
  end
  
  describe "Atomical Attributes" do 

    it "should get an id" do
      expect(@user.id).to eql("17409817")
    end
    
    it "should get a name" do
      expect(@user.name).to eql("Quimby API")
    end
    
    it "should get a first name" do
      expect(@user.first_name).to eql("Quimby")
    end
    
    it "should get a last name" do
      expect(@user.last_name).to eql("API")
    end
    
    it "shout get a photo" do
      expect(@user.photo).to eql("https://foursquare.com/img/blank_girl.png")
    end
    
    it "shout get a gender" do
      expect(@user.gender).to eql("female")
    end
    
    it "shout get a home_city" do
      expect(@user.home_city).to eql("New York, NY")
    end
    
    it "shout get a relationship" do
      expect(@user.relationship).to eql("self")
    end
    
    it "shout get an email" do
      expect(@user.email).to eql("quimby@valade.info")
    end
    
  end
  
  describe "Composed Attributes" do
    it "should fetch created lists" do
      lists = @user.lists("created")
      list = lists.first
      expect(list.id).to eql("4ed53e79722e6f1fdabeae6f")
      expect(list.name).to eql("My First List")
    end
  end
  
end