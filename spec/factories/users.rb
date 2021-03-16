# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
