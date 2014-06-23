# coding: utf-8
FactoryGirl.define do
  factory :category do
    sequence(:name){ |n| "category#{n}" }
  end
end
