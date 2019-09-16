class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  def show; end

  def new
    @ticket = Ticket.new(last_station_id: params[:destination],
                         first_station_id: params[:starting],
                         train_id: params[:train_id],
                         arrival: params[:arrival],
                         departure: params[:departure])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :middle_name, :last_name, :passport, :train_id, :first_station_id,
                                   :last_station_id, :user_id, :arrival, :departure)
  end
end
