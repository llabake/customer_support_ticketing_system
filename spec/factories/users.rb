# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end
