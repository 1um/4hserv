class AddVowelToWord < ActiveRecord::Migration
  def change
  	add_column :words, :vowel, :integer
  end
end
