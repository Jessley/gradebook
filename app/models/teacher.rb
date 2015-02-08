class Teacher < ActiveRecord::Base
  has_secure_password
  has_many :parents
  has_many :students

  validates :password, length: { maximum: 30 }
  validates_confirmation_of :password

  validates :name, presence: true
  validates :name, uniqueness: true


end
