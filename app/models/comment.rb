class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product, touch: true

  # Validations
  validates :text, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # jobs to append the new comment to all users viewing this product
  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

  #Scopes
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  # Methods
  def user_info
#    User.joins(:comments)
  end


end
