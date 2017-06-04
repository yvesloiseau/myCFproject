class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product, touch: true

  # Validations
  validates :text, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  #Scopes
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  # Methods
  def user_info
#    User.joins(:comments)
  end


end
