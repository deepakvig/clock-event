FactoryBot.define do
  factory :track_event do
    time_in { "2019-10-30 10:10:38" }
    time_out { "2019-10-30 10:10:38" }
    description { "MyString" }
    user
  end
end
