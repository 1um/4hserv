class AddOriginalToWorld < ActiveRecord::Migration
  def change
  	add_column :words, :original, :string
  end
end
