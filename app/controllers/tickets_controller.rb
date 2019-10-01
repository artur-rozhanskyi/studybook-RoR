class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show]

  def index
    @tickets = current_user.tickets
  end

  def show; end

  def new
    @ticket = Ticket.new(ticket_params)
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      send_notification @ticket, :buy
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    ticket = current_user.tickets.find(params[:id]).destroy
    send_notification ticket, :delete
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You do not have permission'
  ensure
    redirect_to tickets_path
  end

  private

  def send_notification(ticket, method)
    TicketsMailer.send_ticket_notification(ticket, method)
  end

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
        :departure
      )
  end
  # rubocop:enable Metrics/MethodLength:
end
