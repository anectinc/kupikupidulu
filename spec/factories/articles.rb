# coding: utf-8
FactoryGirl.define do
  factory :article do
    category
    sequence(:title){ |n| "title#{n}" }
    sequence(:description){ |n| "article#{n}'s description" }
    sequence(:source_name){ |n| "article#{n}'s source name" }
    source_url 'http://www.youtube.com/watch?v=e8M6S8EKbnU'
    sequence(:poster_name){ |n| "poster_name#{n}" }
    displayable true
    twitter_shared_count 1
    facebook_shared_count 1
    shared_count 1
    deleted_at nil
  end
end
