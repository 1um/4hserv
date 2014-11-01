class AddColumnPredictToWorld < ActiveRecord::Migration
  def change
  	add_column :words, :predict, :integer
  end
end
