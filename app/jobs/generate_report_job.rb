# frozen_string_literal: true

class GenerateReportJob < ApplicationJob
  queue_as :default

  def perform(report, user)
    # Do something later
    ReportMailer.send_report(report, user).deliver_later
  end
end
