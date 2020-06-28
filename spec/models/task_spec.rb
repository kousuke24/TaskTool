require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is validation" do
    task = Task.new(title: "タイトル", content: "テスト")
    expect(task).to be_valid
  end
end