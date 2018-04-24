class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  #before_action :require_access, only:[:show]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    #@evaluation = Evaluation.new
    #@evaluation.questions = Test.find(16).questions
    #
   @evaluation = Evaluation.create(test_id: params[:test_id], student_id: current_user.id)#, questions: Test.find(16).questions)
   @questionss = Test.find(params[:test_id]).questions
   @questions = []
   @choice = (0..@questionss.length-1).to_a
   if Test.find(@evaluation.test_id).evalnum > @questionss.length
     @count = @questionss.length
   else
     @count = evalnum
   end
   @count.times do
     
     @toto = rand(0..@choice.length-1)
     @questions << @questionss[@choice[@toto]]
     @choice.delete_at(@toto)
    end
   @eanswers = []
   @equestions = []
   @questions.each do |question|
     #equestion = Equestion.new(:question => question.question)
     #equestion.question = question.question
     equestion = @evaluation.equestions.create(:question => question.question)
     #@equestions.push(equestion)
     question.answers.each do |answer|
       eanswer = Eanswer.new
       #eanswer.ans_name = answer.ans_name
       #eanswer.correct = answer.correct
       equestion.eanswers.create(:ans_name => answer.ans_name, :correct => answer.correct)
     end
    
     
   end
   #@evaluation.equestions = equestions
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    
    
    
      if @evaluation.save
        if params[:commit] == 'Submit'
           @evaluation.update_attribute(:complete,true)

         redirect_to @evaluation
       elsif params[:commit] == 'Save'
           @evaluation.update_attribute(:complete,false)

         redirect_to '/mysubjects'
        end
        
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update


      if @evaluation.update(evaluation_params)
       if params[:commit] == 'Submit'
         @evaluation.update_attribute(:complete,true)

         redirect_to @evaluation
       elsif params[:commit] == 'Save'
         @evaluation.update_attribute(:complete,false)
         redirect_to '/mysubjects'
        end
      else
         render :edit
        
      end
    
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:test_id, :student_id, :complete, equestions_attributes: [:id, :question, eanswers_attributes: [ :id, :ans_name, :correct, :ticked] ] )
    end
end
