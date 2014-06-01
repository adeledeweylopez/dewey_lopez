require 'spec_helper'

describe Page do
  	let(:user) { FactoryGirl.create(:user) }
	before { @page = user.pages.build(content: "Lorem ipsum") }

	subject { @page }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:public) }
	it { should respond_to(:sequence) }
	it { should respond_to(:title) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @page.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @page.content = " " }
		it { should_not be_valid }
	end

	
end
