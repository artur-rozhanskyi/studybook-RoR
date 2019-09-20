class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new(ticket_params.merge(user: User.new))
  end

  def create
    user = User.find_or_initialize_by(ticket_params[:user_attributes])
    @ticket = Ticket.new(ticket_params.except(:user_attributes).merge(user: user))
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

  # rubocop:disable Metrics/MethodLength
  def ticket_params
    params
      .require(:ticket)
      .permit(
        :name,
        :middle_name,
        :last_name,
        :passport,
        :train_id,
        :first_station_id,
        :last_station_id,
        :arrival,
        :departure,
        user_attributes: [
          :login,
          :password
        ]
      )
  end
  # rubocop:enable Metrics/MethodLength:
end
