require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    @base_title = 'Ruby on Rails Tutorial Sample App | '
  end
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", 
                    :content => @base_title + "Home")
    end
    
    describe "signed in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      it "should have a micropost form" do
        get 'home'
        response.should have_selector('form', :class => 'new_micropost')
      end
      
      it "should have a micropost feed" do
        mp1 = Factory(:micropost, :user => @user, :content => "Foo bar")
        get 'home'
        response.should have_selector('table', :class => 'microposts')
      end
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
        
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", 
                    :content => @base_title + "Contact")
    end
  end

  describe "GET 'about" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
        
    it "should have the right title" do
      get 'about'
      response.should have_selector("title", 
                    :content => @base_title + "About")
    end
  end
  
  describe "GET 'help" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                    :content => @base_title + "Help")
    end
  end

end
