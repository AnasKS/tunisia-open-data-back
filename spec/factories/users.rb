# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "fame-email-#{n + 900_000}@test.com"
  end
  factory :user do
    transient do
      email { generate(:email) }
    end
    initialize_with do
      args = attributes.merge(email: email)
      User.new(args)
    end
  end
end