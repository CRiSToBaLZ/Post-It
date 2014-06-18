class AddTimestampToPosts2 < ActiveRecord::Migration
  def change
    add_timestamps(:posts)
  end
end
