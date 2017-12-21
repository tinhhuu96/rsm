FactoryGirl.define do
  factory :branch do
    association :company, factory: :company
    is_primary "0"
    street "255 - 257 Hung Vuong"
    ward "Thach Thang"
    district "Hai Chau"
    province "Da Nang"
    country "Vietnam"
  end
end
