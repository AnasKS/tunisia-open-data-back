# frozen_string_literal: true

FactoryBot.define do
  factory :device do
    status { 'MyString' }
    user { nil }
  end
end
