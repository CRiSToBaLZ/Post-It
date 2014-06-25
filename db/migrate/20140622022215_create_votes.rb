class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.boolean :vote
    	t.integer :user_id
    	t.string :voteable_type
    	t.integer :voteable_id
    	# t.references :voteable, polymorphic: true # replaces the two above
    	t.timestamps
    end
  end
end
