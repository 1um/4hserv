class AddFrequancyToWord < ActiveRecord::Migration
  def change
  	add_column :words, :frequancy, :integer
  	add_column :words, :word_length, :integer
  end
end
