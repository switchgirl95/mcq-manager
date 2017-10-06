class Subject < ApplicationRecord
  belongs_to :clazz, optional: true
  has_many :tests
end
