class QoutesController < ApplicationController
	before_action :set_qoute, only: [:show, :edit, :update, :destroy]

  def index
    @qoutes = Qoute.ordered
  end

  def show
  end

  def new
    @qoute = Qoute.new
  end

  def create
    @qoute = Qoute.new(qoute_params)

    if @qoute.save
      respond_to do |format|
        format.html { redirect_to qoutes_path, notice: "Qoute was successfully created." } 
        format.turbo_stream
      end      
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end	

  def update
    if @qoute.update(qoute_params)
      redirect_to qoutes_path, notice: "Qoute was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @qoute.destroy
    respond_to do |format|
      format.html { redirect_to qoutes_path, notice: "Qoute was successfully destroyed." } 
      format.turbo_stream
    end
    
  end

  private

  def set_qoute
    @qoute = Qoute.find(params[:id])
  end

  def qoute_params
    params.require(:qoute).permit(:name)
  end

end
