class Clazz < ApplicationRecord
  belongs_to :department, optional: true
  has_many :subjects
  
  before_save :save_class_code
  before_update :save_class_code
  
  private
  def save_class_code
    self.class_code = self.level.to_s + Department.find(self.department_id).dept_code
  end

end
