# frozen_string_literal: true

class Agent::TicketsController < ApplicationController
  before_action :is_agent

  def index
    if is_agent
      tickets = Ticket.where(assigned_to: current_user.name).recent
      json_response(tickets)
    else
      json_response({
                      message: 'You are not authorized to access this page'
                    },
                    :unauthorized)
    end
  end

  def update
    if is_agent
      ticket = Ticket.find(params[:id])
      ticket.update(ticket_params)
      json_response(ticket)
    else
      json_response({
                      message: 'You are not authorized to access this page'
                    },
                    :unauthorized)
    end
  end

  def export
    tickets = Ticket.export
    csv_data = tickets.to_csv
    send_data csv_data, type: 'text/csv',
                        filename: 'closed_tickets.csv',
                        disposition: 'attachment'
  end

  private

  def ticket_params
    params.permit(:status)
  end

  def is_agent
    current_user.agent?
  end
end
