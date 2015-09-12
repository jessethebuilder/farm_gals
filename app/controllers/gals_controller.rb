class GalsController < ApplicationController
    before_action :set_gal, only: [:show, :edit, :update, :destroy]

  def index
    @gals = Gal.all
  end

  def show
  end

  def new
    @gal = Gal.new
  end

  # GET /objs/1/edit
  def edit
  end

  # POST /objs
  def create
    @gal = Gal.new(gal_params)

    if @gal.save
      redirect_to @gal, notice: 'Gal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /objs/1
  def update
    if @gal.update(gal_params)
      redirect_to @gal, notice: 'Gal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /objs/1
  def destroy
    @gal.destroy
    redirect_to gals_url, notice: 'Gal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gal
      @gal = Gal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # params.require(:client).permit(:name, :description, :homepage_url)
    
    def gal_params
      params.require(:gal).permit(:name, :gal_image_attributes => [:caption, :src, :description])
    end
end