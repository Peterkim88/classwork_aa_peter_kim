class CheatingsController < ApplicationController
  before_action :set_cheating, only: %i[ show edit update destroy ]

  # GET /cheatings or /cheatings.json
  def index
    @cheatings = Cheating.all
  end

  # GET /cheatings/1 or /cheatings/1.json
  def show
  end

  # GET /cheatings/new
  def new
    @cheating = Cheating.new
  end

  # GET /cheatings/1/edit
  def edit
  end

  # POST /cheatings or /cheatings.json
  def create
    @cheating = Cheating.new(cheating_params)

    respond_to do |format|
      if @cheating.save
        format.html { redirect_to cheating_url(@cheating), notice: "Cheating was successfully created." }
        format.json { render :show, status: :created, location: @cheating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cheating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheatings/1 or /cheatings/1.json
  def update
    respond_to do |format|
      if @cheating.update(cheating_params)
        format.html { redirect_to cheating_url(@cheating), notice: "Cheating was successfully updated." }
        format.json { render :show, status: :ok, location: @cheating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cheating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheatings/1 or /cheatings/1.json
  def destroy
    @cheating.destroy

    respond_to do |format|
      format.html { redirect_to cheatings_url, notice: "Cheating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheating
      @cheating = Cheating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cheating_params
      params.fetch(:cheating, {})
    end
end
