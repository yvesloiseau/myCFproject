class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :prd_type
      t.string :brand
      t.string :color
      t.decimal :price
      t.string :image_url
      t.string :feature1
      t.string :feature2
      t.string :feature3

      t.timestamps
    end
  end
end
