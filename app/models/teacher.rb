class Teacher < ActiveRecord::Base
  has_secure_password
  has_many :parents
  has_many :students

  validates :password, length: { maximum: 30 }
  validates_confirmation_of :password

  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true


end
