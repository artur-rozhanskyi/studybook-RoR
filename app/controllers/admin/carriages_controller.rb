module Admin
  class CarriagesController < BaseController
    before_action :set_train, only: [:new, :create, :index]
    before_action :set_carriage, only: [:show, :edit, :update, :destroy]

    def index
      @carriages = Carriage.all
    end

    def show; end

    def new
      @carriage = Carriage.new
    end

    def edit; end

    def create
      @carriage = @train.carriages.new(carriage_params)
      if @carriage.save
        redirect_to admin_train_path(@train), notice: 'Carriage was successfully created.'
      else
        render :new
      end
    end

    def update
      if @carriage.update(carriage_params)
        redirect_to admin_carriage_path(@carriage.becomes(Carriage)), notice: 'Carriage was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @carriage.destroy
      redirect_to admin_train_path(@carriage.train), notice: 'Carriage was successfully destroyed.'
    end

    private

    def set_train
      @train = Train.find(params[:train_id])
    end

    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:train_id, :type, :bottom_places, :upper_places, :side_bottom_places,
                                       :side_upper_places, :seats)
    end
  end
end
