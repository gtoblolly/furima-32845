FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname                {Faker::Name.last_name}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)+ "a1"}
    password_confirmation   {password}
    last_name               { japanese_user.last.kanji }
    first_name              { japanese_user.first.kanji }
    last_name_kana          { japanese_user.last.katakana }
    first_name_kana         { japanese_user.first.katakana }
    birthday                {Faker::Date.birthday}
  end
end