FactoryGirl.define do
  factory :office_address do
    references ""
    street "MyString"
    number ""
    floor "MyString"
    appartment "MyString"
    notes "MyString"
    enabled false
    deleted_at "2016-10-29 18:58:56"
  end
end
