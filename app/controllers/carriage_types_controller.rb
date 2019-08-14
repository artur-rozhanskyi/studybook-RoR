class CarriageTypesController < ApplicationController
  before_action :set_carriage_type, only: [:show, :edit, :update, :destroy]

  def index
    @carriage_types = CarriageType.all
  end

  def show; end

  def new
    @carriage_type = CarriageType.new
  end

  def edit; end

  def create
    @carriage_type = CarriageType.new(carriage_type_params)
    if @carriage_type.save
      redirect_to @carriage_type, notice: 'Carriage type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage_type.update(carriage_type_params)
      redirect_to @carriage_type, notice: 'Carriage type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage_type.destroy
    redirect_to carriage_types_path, notice: 'Carriage type was successfully destroyed.'
  end

  private

  def set_carriage_type
    @carriage_type = CarriageType.find(params[:id])
  end

  def carriage_type_params
    params.require(:carriage_type).permit(:name)
  end
end
