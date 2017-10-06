class Equestion < ApplicationRecord
  belongs_to :evaluation, optional: true
  has_many :eanswers
  accepts_nested_attributes_for :eanswers, allow_destroy: true
  before_update :calculate

  def calculate
    self.totalcorr = 0
    self.totalgot = 0
  	self.eanswers.each do |answer|
      if answer.correct
        self.totalcorr += 1
      else
      end
      if answer.ticked && answer.correct
      	self.totalgot += 1
      else
      end	
    end

  end	
end
