FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname                {"フリマくん"}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)+ "a1"}
    password_confirmation   {password}
    last_name               {"てっく"}
    first_name              {"きゃんぷ"}
    last_name_kana          {"テック"}
    first_name_kana         {"キャンプ"}
    birthday                {"2018-10-30"}
  end
end