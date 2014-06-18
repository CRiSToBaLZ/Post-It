class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :height_in_inches, :weight_in_lbs
    end
  end
end
