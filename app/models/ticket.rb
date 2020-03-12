# frozen_string_literal: true

require 'csv'

class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  REQUEST_STATUSES = {
    open: 'open',
    solved: 'solved',
    pending: 'pending',
    in_progress: 'in_progress',
    assigned: 'assigned'
  }.freeze

  enum status: REQUEST_STATUSES

  validates :title, :description, presence: true

  def self.recent
    order('created_at DESC')
  end

  def self.export
    where(updated_at: 1.month.ago..Time.now).recent
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
end
