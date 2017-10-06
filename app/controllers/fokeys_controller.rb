class FokeysController < ApplicationController
  before_action :set_fokey, only: [:show, :edit, :update, :destroy]

  # GET /fokeys
  # GET /fokeys.json
  def index
    @fokeys = Fokey.all
  end

  # GET /fokeys/1
  # GET /fokeys/1.json
  def show
  end

  # GET /fokeys/new
  def new
    @fokey = Fokey.new
  end

  # GET /fokeys/1/edit
  def edit
  end

  # POST /fokeys
  # POST /fokeys.json
  def create
    @fokey = Fokey.new(fokey_params)

    respond_to do |format|
      if @fokey.save
        format.html { redirect_to @fokey, notice: 'Fokey was successfully created.' }
        format.json { render :show, status: :created, location: @fokey }
      else
        format.html { render :new }
        format.json { render json: @fokey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fokeys/1
  # PATCH/PUT /fokeys/1.json
  def update
    respond_to do |format|
      if @fokey.update(fokey_params)
        format.html { redirect_to @fokey, notice: 'Fokey was successfully updated.' }
        format.json { render :show, status: :ok, location: @fokey }
      else
        format.html { render :edit }
        format.json { render json: @fokey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fokeys/1
  # DELETE /fokeys/1.json
  def destroy
    @fokey.destroy
    respond_to do |format|
      format.html { redirect_to fokeys_url, notice: 'Fokey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fokey
      @fokey = Fokey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fokey_params
      params.fetch(:fokey, {})
    end
end
