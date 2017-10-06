class Evaluation < ApplicationRecord
  belongs_to :student
  belongs_to :test
  has_many :equestions
  accepts_nested_attributes_for :equestions, allow_destroy: true
  before_update :calculate
   
  def calculate
   	puts 'calculating...'
    self.score = 0
    self.equestions.each do |quest|
    	quest.eanswers.each do |ans|
    		if ans.ticked && ans.correct
    			puts 'correct!'
    			self.score +=1
    		else
    		end
    	end
    end
  end
end
