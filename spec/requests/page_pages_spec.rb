require 'spec_helper'

describe "PagePages" do
  subject { page }
	
	describe "page webpage" do
		let(:page) { FactoryGirl.create(:page) }
		
		before { visit page_path(page) }

		it { should have_content(page.content) }
		it { should have_title(page.title) }
	end

	
end
