class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  #Scopes
  scope :id_desc, -> { order(id: :desc) }

end
