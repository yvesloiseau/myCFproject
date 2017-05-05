class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments

  # Validations
  validates :first_name, presence: true, length: {in: 1..30}
  validates :last_name, presence: true, length: {in: 1..30}

 end
