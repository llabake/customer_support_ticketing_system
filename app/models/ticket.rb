# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  REQUEST_STATUSES = { open: 'open', solved: 'solved', pending: 'pending' }.freeze

  enum status: REQUEST_STATUSES
  # validates :title, presence: {message: "Title can't be blank" }
  # validates :description, presence: { message: "Description can't be blank" }

  validates :title, :description, presence: true

  def self.recent
    order('created_at DESC')
  end
end
