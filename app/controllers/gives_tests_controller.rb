class GivesTestsController < ApplicationController
  before_action :set_gives_test, only: [:show, :edit, :update, :destroy]

  # GET /gives_tests
  # GET /gives_tests.json
  def index
    @gives_tests = GivesTest.all
  end

  # GET /gives_tests/1
  # GET /gives_tests/1.json
  def show
  end

  # GET /gives_tests/new
  def new
    @gives_test = GivesTest.new
  end

  # GET /gives_tests/1/edit
  def edit
  end

  # POST /gives_tests
  # POST /gives_tests.json
  def create
    @gives_test = GivesTest.new(gives_test_params)

    respond_to do |format|
      if @gives_test.save
        format.html { redirect_to @gives_test, notice: 'Gives test was successfully created.' }
        format.json { render :show, status: :created, location: @gives_test }
      else
        format.html { render :new }
        format.json { render json: @gives_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gives_tests/1
  # PATCH/PUT /gives_tests/1.json
  def update
    respond_to do |format|
      if @gives_test.update(gives_test_params)
        format.html { redirect_to @gives_test, notice: 'Gives test was successfully updated.' }
        format.json { render :show, status: :ok, location: @gives_test }
      else
        format.html { render :edit }
        format.json { render json: @gives_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gives_tests/1
  # DELETE /gives_tests/1.json
  def destroy
    @gives_test.destroy
    respond_to do |format|
      format.html { redirect_to gives_tests_url, notice: 'Gives test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gives_test
      @gives_test = GivesTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gives_test_params
      params.fetch(:gives_test, {})
    end
end
