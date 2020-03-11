# frozen_string_literal: true

class Admin::TicketsController < ApplicationController
  before_action :is_admin

  def index
    if is_admin
      tickets = Ticket.recent
      json_response(tickets)
    else
      json_response({
                      message: 'You are not authorized to access this page'
                    },
                    :unauthorized)
    end
  end

  def update
    if is_admin
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

  private

  def ticket_params
    params.permit(:assigned_to, :status)
  end

  def is_admin
    current_user.admin?
  end
end
