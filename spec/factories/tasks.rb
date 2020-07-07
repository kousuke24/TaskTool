FactoryBot.define do
  factory :task do
    title { 'タイトル' }
    content { 'コンテンツ' }
    deadline { '2020-01-01' }
  end
end
