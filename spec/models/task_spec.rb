require 'rails_helper'

RSpec.describe Task, type: :system do
  describe '#index' do
    before do
      Task.new(id: "1", title: "タスク01", content: "テスト01", deadline: "2020-07-02")
      Task.new(id: "2", title: "タスク02", content: "テスト02", deadline: "2020-07-01")
      @task = Task.all
    end

    it 'is create_at DESK' do
      #visit root_path
      #select '作成日時順', from: 'sort'
      #click_on '並べ替え'
      #expect(@task[0]).to have_content("タスク02")
      #expect(@task[1]).to have_content("タスク01")
    end

    it 'is deadline ASC' do
      #visit root_path
      #select '終了期限順', from: 'sort'
      #click_on '並べ替え'
      #expect(@task[0]).to have_content("タスク02")
      #expect(@task[1]).to have_content("タスク01")
    end
  end
end