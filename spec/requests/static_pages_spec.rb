require 'spec_helper'

describe "StaticPages" do
	
	describe "Home page" do
		it "should have the content 'dewey-lopez'" do
    		visit '/static_pages/home'
    		expect(page).to have_content('dewey-lopez')
  		end
	end

	describe "About page" do
		it "should have the content 'About'" do
    		visit '/static_pages/about'
    		expect(page).to have_content('About')
  		end
	end
end
