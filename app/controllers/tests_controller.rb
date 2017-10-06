class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    
  end

  # GET /tests/new
  def new
    if params.to_unsafe_h.except!(:controller, :action).nil?
    @test = Test.new(teacher_id: current_user.id) 
    else
    @test = Test.new params.to_unsafe_h.except!(:controller, :action)
    @test.teacher_id = current_user.id
  end
  end

  # GET /tests/1/edit
  def edit
  end

  # GET /tests/1/display
  def display
    @test = Test.find(params[:id])
    @evals = Evaluation.where(student_id: current_user.id, test_id: @test.id).order("created_at").last

  end
  def import
  @test = Test.import(params[:file])
  if @test.id.present?
    redirect_to edit_test_path(@test)
  else
    redirect_to new_test_path(@test.attributes)
  end
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.teacher_id = current_user.id
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:subject_id, :title, :objective,:teacher_id, questions_attributes: [:id, :question, Question.attribute_names.map(&:to_sym).push(:_destroy), answers_attributes: [ :id, :ans_name, :correct, Answer.attribute_names.map(&:to_sym).push(:_destroy) ] ] )
      #, answers_attributes: [ :id, :ans_name, :correct ] 
    end
end
