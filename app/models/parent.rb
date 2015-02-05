class Parent < ActiveRecord::Base
  has_secure_password
  belongs_to :teacher
  has_many :students
end
