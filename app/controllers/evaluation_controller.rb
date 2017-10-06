class EvaluationController < ApplicationController
  def list
   @tests = Test.all
  end
end
