require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is validation" do
    task = Task.new(title: "t" * 30 , content: "c" * 250)
    expect(task).to be_valid
  end
end