# README

## タイトル

# Evolving Word Book

## 📗 概要

# 他のユーザーと作る単語帳

## 🔍 使い方

### 左にある項目をクリックする事で単語帳を見る事ができ、下にスライドすると説明があります。
### ユーザー登録する事でできる事は以下です。
### ・単語に説明を書き込む事ができる
### ・説明を「いいね」をする事ができる
### 説明を「いいね」をする事で説明の一番上に持ってくる事ができ、個々の単語帳ができます！

![HnyJEIyvKNV1QPUiOMlK1586791044-1586791070](https://user-images.githubusercontent.com/61224740/79132595-96d8e100-7de5-11ea-878a-be8d0a6ae26e.gif)

## 🌐 App URL

### **https://pure-chamber-75476.herokuapp.com/**

### ID  : test@test.com
### pass: 12345678

## 📗 制作背景

### 私は、プログラミング学習の為に人生で初めて単語帳を使い、回数を重ねる事に頭に入る感覚に感動しました。
### しかし、漢字や英語のような元々記述されている単語帳はプログラミングにはなく、個々にとって理解し易い説明は異なる為にプログラミングの単語帳はないのではないか？と考えました。
### それならば、他の人と内容を作成していき個々にとって最適な説明を見る事ができれば、プログラミングの単語帳もできるのではないか？と考え作成しました。

・画像
・工夫したポイント
・使用技術(開発環境)
・課題や今後実装したい機能

# DB設計

## usersテーブル
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

## titlesテーブル
|Column|Type|Options|
|------|----|-------|
|titl|string|null: false|
### Association
- has_many :item

## itemsテーブル
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

## contentsテーブル
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

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|content_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :content
- belongs_to :user