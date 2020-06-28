require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe Task, type: :system do
  describe '#index' do
    it 'is Task DESC' do
      task1 = Task.new(id: "1", title: "タスク01", content: "テスト０１")
      task2 = Task.new(id: "2", title: "タスク02", content: "テスト０２")
      #visit root_path
      task = Task.all
      #expect(task[0]).to have_content("タスク02")
      #expect(task[1]).to have_content("タスク01")
    end
  end
end