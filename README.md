## データベース図  
![データベース図](images/IMG_2507.jpeg)

## 画面設計（予定）  
![画面設計1](images/IMG_2508.jpeg)
![画面設計2](images/IMG_2509.jpeg)
![画面設計3](images/IMG_2510.jpeg)
![画面設計4](images/IMG_2511.jpeg)
![画面設計5](images/IMG_2512.jpeg)
![画面設計6](images/IMG_2513.jpeg)

## テーブルスキーマ  
*(モデル名・カラム名・データ型)*  

(task・title・string)  
(task・content・string)  
(task・deadline・date)  
(task・user_id・integer)  
(task・status_id・integer)  
(task・priority_id・integer)  

(user・name・string)  
(user・password_digest・string)  
(user・admin_flag・string)  

(status・name・string)  

(priority・name・string)  

(label・name・string)  

(tasks_labels_relation・task_id・integer)  
(tasks_labels_relation・label_id・integer) 

## 環境  
Ruby 2.6.2
Rails 5.2.3
PostgreSQL 1.1.4

## ライブラリ  
group :development, :test do  
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  
end  

group :development do  
  gem 'web-console', '>= 3.3.0'  
  gem 'listen', '>= 3.0.5', '< 3.2'  
  gem 'spring'  
  gem 'spring-watcher-listen', '~> 2.0.0'  
  gem 'rubocop'  
  gem 'pry-rails'  
  gem 'rspec-rails'  
end  

group :test do  
  gem 'selenium-webdriver'  
  gem 'webdrivers'  
  gem 'rubocop'  
  gem 'pry-rails'  
  gem 'rspec-rails'  
  gem 'capybara'  
end  

## Herokuデプロイ手順   
### Rails設定  
①トップページの設定  
②confin/environments/production.rbのconfin.assets.complie = false を true に変更  

### Git設定  
①ローカルリポジトリ作成  
②変更をコミット  

### Heroku設定  
①Heroku登録  
②Herokuダウンロード(brew tap heroku/brew && brew install heroku)  

### デプロイ
①Herokuログイン  
②アプリケーション作成  
③Herokuにデプロイ  