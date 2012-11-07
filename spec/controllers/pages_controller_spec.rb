require 'spec_helper'

describe PagesController do
  render_views              # PTN to tell RSpec to render views as well. by default it just tests actions inside controller test; if we want to tell it explicitly via the second line
                            #     this ensures that if the test passes, the page is really there

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'                  # it calls /pages/home as the test is a Pages controller test
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      # PTN 1. have_selector method inside RSpec checks for an HTML element (the "selector") - <title></title> in this case
      # PTN 2. the render_views line is important for the tests to work
      response.should have_selector("title",
                      :content => "| Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                                    :content => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                                    :content => "About")
    end

  end

end
