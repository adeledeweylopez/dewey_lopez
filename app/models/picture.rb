class Picture < ActiveRecord::Base
	has_attached_file :photo, :url => "/pictures/:id/:basename.:extension",
	:path => ":rails_root/public/pictures/:id/:basename.:extension", :use_timestamp => false

    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
