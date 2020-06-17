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
