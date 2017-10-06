class Test < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
  

  def randomise
    random ||= []
    questionz = self.questions
    self.evalnum.times do
      m = rand(questionz.length)
      random << questionz(m)
      questionz.delete_at(m)
    end
  end  
  def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  question = Question.new
  answer = Answer.new
  header = spreadsheet.row(1)
  
    row = Hash[[header, spreadsheet.row(2)].transpose]
    test = find_by(id: row["id"]) || new
    test.attributes = row.to_hash
    
    test
  #  header = spreadsheet.row(3)
  # (4..spreadsheet.last_row).each do |i|
  #  if (spreadsheet.cell(i,1).nil?)
  #    if i!= 4
  #    test.questions << question
  #    end
   #   question = Question.new
   #   question.question = spreadsheet.cell(i,1)
   #   
      
    #row = Hash[[header, spreadsheet.row(i)].transpose]
    
    
    #question.attributes = row.to_hash
  #  else
  #    answer = Answer.new(ans_name: spreadsheet.cell(i,2) )
      #row = Hash[[header, spreadsheet.row(i)].transpose]
      #answer.attributes = row.to_hash
   #   question.answers << answer
  #  end  
    
 # end
#test.save
#Test.new
  
end 
end
