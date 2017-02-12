json.extract! product, :id, :name, :description, :prd_type, :brand, :color, :price, :image_url, :feature1, :feature2, :feature3, :created_at, :updated_at
json.url product_url(product, format: :json)