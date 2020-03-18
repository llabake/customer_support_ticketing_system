# frozen_string_literal: true

class ReportMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.send_report.subject
  #
  def send_report(report, user)
    dir = Rails.root.join('public', 'pdfs')
    @report = report
    @recipient = user.email
    @subject = "Monthly report for #{1.month.ago..Time.now}"
    @greeting = "Hi, #{user.name}"
    @body = 'Please find your report in the document attached'
    attachments[@report.to_s] = File.read(dir.join(@report))
    mail(to: @recipient, subject: @subject, body: @body)
  end
end
