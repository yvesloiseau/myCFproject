class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  # Validations
  validates :name, presence: true
  validates :description, presence: true,
                          length: { minimum: 5 }
  validates :product_type, presence: true
  validates :brand, presence: true
  validates :price, presence: true,
                  numericality: true

  #  Searches
  def self.search(search_term)
  	if Rails.env.development?
  		Product.where("name LIKE ?", "%#{search_term}%")
  	else
  		Product.where("name ilike ?", "%#{search_term}%")
		end
	end

  # Methods
  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

end
