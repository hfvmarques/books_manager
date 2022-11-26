# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'email@provider.com' }
    password { 'whatever_password_in_store' }
    password_confirmation { 'whatever_password_in_store' }
  end
end
