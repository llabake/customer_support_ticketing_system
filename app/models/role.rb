# frozen_string_literal: true

class Role < ApplicationRecord
  ALLOWED_ROLES = %w[admin agent user].freeze
  has_many :users

  validates_inclusion_of :name, in: ALLOWED_ROLES,
                                message: '%{value} is not a  valid role type'
end
