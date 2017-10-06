class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
  before_update :calculate
  before_save :calculate

  def calculate
  	self.totalcorr = 0
  	self.answers.each do |answer|
      if answer.correct
      	self.totalcorr += 1
      else
      end
      			
    end

  end	
end
