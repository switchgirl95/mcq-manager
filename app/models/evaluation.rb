class Evaluation < ApplicationRecord
  belongs_to :student
  belongs_to :test
  has_many :equestions
  accepts_nested_attributes_for :equestions, allow_destroy: true
  before_update :calculate
   
  def calculate
   	puts 'calculating...'
    self.score = 0
    self.total = 0
    self.equestions.each do |quest|
    	quest.eanswers.each do |ans|
        if ans.correct
          self.total +=1
        else
        end
    		if ans.ticked && ans.correct
    			puts 'correct!'
    			self.score +=1
    		elsif ans.ticked && !ans.correct
          self.score -=1
        else
    		end
    	end
    end
    if self.score <0
      self.score = 0
    else
    end
  end
end
