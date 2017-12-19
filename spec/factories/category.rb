FactoryGirl.define do
  factory :category do
    name "Back Office"
    description "Category Back Office"
    association :company, factory: :company
  end
end
