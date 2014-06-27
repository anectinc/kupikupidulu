# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medium, class: 'Medium' do
    article
    type 'Medium'

    factory :image, class: 'Image' do
      file_url 'http://i.ytimg.com/vi/e8M6S8EKbnU/default.jpg'
      type 'Image'
    end

    factory :video, class: 'Video' do
      video_code 'e8M6S8EKbnU'
      type 'Video'
    end
  end
end
