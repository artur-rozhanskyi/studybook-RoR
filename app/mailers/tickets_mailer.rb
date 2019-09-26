class TicketsMailer < ApplicationMailer
  before_action :set_instance_variables

  def self.send_ticket_notification(user, ticket, method)
    return unless new.respond_to?("#{method}_email")

    with(user: user, ticket: ticket)
      .public_send("#{method}_email")
      .deliver_now
  end

  def buy_email
    mail(to: @user.email, subject: t('.subject'))
  end

  def delete_email
    mail(to: @user.email, subject: t('.subject'))
  end

  private

  def set_instance_variables
    @user = params[:user]
    @ticket = params[:ticket]
  end
end
