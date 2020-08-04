FactoryBot.define do
  factory :user do
    name { "ユーザー名" }
    password_digest { "password" }
  end
end
