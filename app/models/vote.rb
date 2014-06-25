class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :voteable, polymorphic: true

	validates_uniqueness_of :user, scope: [:voteable_id, :voteable_type]
	# scope checks that same user cannot create a vote for the same object.
	# without scope each user could only vote for one thing total amongst votes/comments
end