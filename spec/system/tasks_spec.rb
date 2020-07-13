require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe Task, type: :system do
  describe '#index' do
    it 'is Task DESC' do
      described_class.new(id: '1', title: 'タスク01', content: 'テスト０１')
      described_class.new(id: '2', title: 'タスク02', content: 'テスト０２')
      # visit root_path
      @task = described_class.all
      # expect(@task[0]).to have_content("タスク02")
      # expect(@task[1]).to have_content("タスク01")
    end
  end
end
