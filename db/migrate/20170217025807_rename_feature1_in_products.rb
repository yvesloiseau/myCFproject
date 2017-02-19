class RenameFeature1InProducts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :feature1, :top_size
  	rename_column :products, :feature2, :other_features
  	rename_column :products, :feature3, :number_of_pockets
  	rename_column :products, :prd_type, :product_type
  end
end
