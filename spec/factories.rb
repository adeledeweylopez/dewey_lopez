FactoryGirl.define do 
	factory :user do
		name	"Adele"
		email	"a@b.c"
		password "foobar"
		password_confirmation "foobar"
	end
end