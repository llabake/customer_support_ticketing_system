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
    csv_data = generate_csv_report
    file_name = write_data_to_file(csv_data)
    GenerateReportJob.perform_later(file_name, current_user)
    # File.delete(dir.join(file_name))
    json_response(
      {
        message:
            'Your report is being generated and would be sent to your mail'
      }
    )
  end

  private

  def write_data_to_file(csv_data)
    file_name = 'closed_tickets.csv'
    dir = Rails.root.join('public', 'pdfs')
    Dir.mkdir(dir) unless Dir.exist?(dir)
    File.open(dir.join(file_name), 'w') do |file|
      file.write(csv_data)
      file.close
    end
    file_name
  end

  def generate_csv_report
    tickets = Ticket.export
    tickets.to_csv
  end

  def ticket_params
    params.permit(:status)
  end

  def is_agent
    current_user.agent?
  end
end
