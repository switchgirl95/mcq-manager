class Student < ApplicationRecord
  belongs_to :clazz, optional: true
  has_many :tests, :through => :completeds
  has_many :completeds
end
