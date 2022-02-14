class FullSetsController < ApplicationController
  before_action :set_full_set, only: %i[ show edit update destroy ]

  # GET /full_sets or /full_sets.json
  def index
    @full_sets = FullSet.all
  end

  # GET /full_sets/1 or /full_sets/1.json
  def show
  end

  # GET /full_sets/new
  def new
    @full_set = FullSet.new
  end

  # GET /full_sets/1/edit
  def edit
  end

  # POST /full_sets or /full_sets.json
  def create
    @full_set = FullSet.new(full_set_params)

    respond_to do |format|
      if @full_set.save
        format.html { redirect_to full_set_url(@full_set), notice: "Full set was successfully created." }
        format.json { render :show, status: :created, location: @full_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @full_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /full_sets/1 or /full_sets/1.json
  def update
    respond_to do |format|
      if @full_set.update(full_set_params)
        format.html { redirect_to full_set_url(@full_set), notice: "Full set was successfully updated." }
        format.json { render :show, status: :ok, location: @full_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @full_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_sets/1 or /full_sets/1.json
  def destroy
    @full_set.destroy

    respond_to do |format|
      format.html { redirect_to full_sets_url, notice: "Full set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_set
      @full_set = FullSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def full_set_params
      params.fetch(:full_set, {})
    end
end
