FactoryBot.define do
  factory :user do
    user_name {"テスト太郎"}
    email {Faker::Internet.email}
    password {'1a'+ Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    date_of_birth {'1960-01-01'}
    last_name {"近藤"}
    first_name {"義宗"}
    last_name_kana {"コンドウ"}
    first_name_kana {"ヨシムネ"}
  end
end
