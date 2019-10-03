require 'rails_helper'

RSpec.describe TicketsMailer, type: :mailer do
  let(:ticket) { create(:ticket) }
  let(:buy_email) { described_class.send_ticket_notification(ticket, :buy) }
  let(:delete_email) { described_class.send_ticket_notification(ticket, :delete) }

  describe '.send_ticket_notification' do
    context 'when user buy ticket' do
      it_behaves_like 'tickets_email' do
        let(:email) { buy_email }
        let(:user) { ticket.user }
        let(:subject) { 'Покупка билета' }
      end
    end

    context 'when user delete ticket' do
      it_behaves_like 'tickets_email' do
        let(:email) { delete_email }
        let(:user) { ticket.user }
        let(:subject) { 'Отмена билета' }
      end
    end
  end
end
