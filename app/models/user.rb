# frozen_string_literal: true

class User < ApplicationRecord
  SUPER_ADMIN = 'admin'
  AGENT = 'agent'

  has_many :tickets
  has_many :comments

  belongs_to :role,
             required: false

  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password_digest, presence: true, length: { minimum: 6 }

  def admin?
    role.name == SUPER_ADMIN
  end

  def agent?
    role.name == AGENT
  end
end
