class ObjsController < ApplicationController
  before_action :set_obj, only: [:show, :edit, :update, :destroy]

  # GET /objs
  def index
    @objs = Obj.all
  end

  # GET /objs/1
  def show
  end

  # GET /objs/new
  def new
    @obj = Obj.new
  end

  # GET /objs/1/edit
  def edit
  end

  # POST /objs
  def create
    @obj = Obj.new(obj_params)

    if @obj.save
      redirect_to @obj, notice: 'Obj was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /objs/1
  def update
    if @obj.update(obj_params)
      redirect_to @obj, notice: 'Obj was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /objs/1
  def destroy
    @obj.destroy
    redirect_to objs_url, notice: 'Obj was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obj
      @obj = Obj.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def obj_params
      params[:obj]
    end
end
