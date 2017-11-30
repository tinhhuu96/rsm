FactoryGirl.define do
  factory :club do
    name {Faker::Name.name}
    user_id 1
    created_at Date.today
    updated_at Date.today
    position {Faker::Job.title}
    start_time Time.zone.today-1
    end_time Time.zone.today
    content {Faker::Lorem.paragraph}
    current false
  end
end
