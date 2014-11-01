class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :user_id
      t.string :ruword
      t.string :engword
      t.boolean :learned
      t.integer :viewed
      t.timestamps
    end
  end
end
