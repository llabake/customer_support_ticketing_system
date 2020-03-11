# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show update destroy]
  def index
    tickets = current_user.tickets.recent
    json_response(tickets)
  end

  def create
    ticket = current_user.tickets.create!(ticket_params)
    json_response(ticket, :created)
  end

  def show
    ticket = Ticket.includes(:comments).find(params[:id])
    json_response({ ticket: ticket, comments: ticket.comments })
  end

  def update
    ticket.update(ticket_params)
    json_response(ticket)
  end

  def destroy
    ticket.destroy
    json_response(ticket)
  end

  private

  def ticket_params
    params.permit(:title, :description, :status)
  end

  def set_ticket
    Ticket.find(params[:id])
  end
end
