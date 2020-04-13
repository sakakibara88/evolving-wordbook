# README

## タイトル

# Evolving Word Book

## 📗 概要

# 他のユーザーと作る単語帳

## 🌐 App URL

### **https://pure-chamber-75476.herokuapp.com/**

# 📗 制作背景

### 私は、プログラミング学習の為に人生で初めて単語帳を使い、回数を重ねる事に頭に入る感覚に感動しました。
### しかし、漢字や英語のような元々記述されている単語帳はプログラミングにはなく、個々にとって理解し易い説明は異なる為にプログラミングの単語帳はないのではないか？と考えました。
### それならば、他の人と内容を作成していき個々にとって最適な説明を見る事ができれば、プログラミングの単語帳もできるのではないか？と考え作成しました。

# DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many  :items
- has_many  :contents
- has_many  :goods, dependent: :destroy
- has_many  :good_contents, through: :goods, source: :content

## contentテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to:user
- belongs_to:item
- has_many  :goods, dependent: :destroy
- has_many  :good_users, through: :goods, source: :user

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|title_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to:user
- belongs_to:item
- has_many  :goods, dependent: :destroy
- has_many  :good_users, through: :goods, source: :user

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|content_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :content
- belongs_to :user