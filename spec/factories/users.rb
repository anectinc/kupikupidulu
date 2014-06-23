# coding: utf-8
FactoryGirl.define do
  salt = "asdasdastr4325234324sdfds"
  factory :user do
    sequence(:name){ |n| "name#{n}" }
    email { "#{name}@example.com" }
    password 'secret'
    password_confirmation 'secret'
    salt salt
  end
end
