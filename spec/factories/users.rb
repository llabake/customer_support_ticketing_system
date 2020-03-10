# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end

  trait :admin do
    role { 'admin' }
  end

  trait :agent do
    role { 'agent' }
  end
end
