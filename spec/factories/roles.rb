# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'user' }
    description { 'foobar' }
  end
end
