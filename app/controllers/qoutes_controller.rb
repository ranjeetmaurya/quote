class QoutesController < ApplicationController
	before_action :set_qoute, only: [:show, :edit, :update, :destroy]

  def index
    @qoutes = Qoute.all
  end

  def show
  end

  def new
    @qoute = Qoute.new
  end

  def create
    @qoute = Qoute.new(qoute_params)

    if @qoute.save
      redirect_to qoutes_path, notice: "Qoute was successfully created."
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
    redirect_to qoutes_path, notice: "Qoute was successfully destroyed."
  end

  private

  def set_qoute
    @qoute = Qoute.find(params[:id])
  end

  def qoute_params
    params.require(:qoute).permit(:name)
  end

end
