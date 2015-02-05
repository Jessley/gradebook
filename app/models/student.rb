class Student < ActiveRecord::Base
  belongs_to :parent
  belongs_to :teacher
  has_many :grades
  has_secure_password
end
