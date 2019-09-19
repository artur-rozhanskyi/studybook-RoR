class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  before_action :set_user, only: [:create]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new(ticket_params)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = @user
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_user
    @user = User.find_or_create_by user_params
  end

  def user_params
    params.require(:ticket).permit(user: [:login, :password])[:user]
  end

  def ticket_params
    params.require(:ticket).permit(:name, :middle_name, :last_name, :passport, :train_id, :first_station_id,
                                   :last_station_id, :user_id, :arrival, :departure)
  end
end
