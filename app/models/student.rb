class Student < ActiveRecord::Base
  belongs_to :parent
  belongs_to :teacher
  has_many :grades
end
