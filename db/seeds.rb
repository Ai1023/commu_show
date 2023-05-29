# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  [
    {email: 'game@test.com', password: 'game2434'}
  ]
)

Tag.create!(
  [
    { tag_name: 'アクション' },
    { tag_name: 'パズル'},
    { tag_name: 'シミュレーション'},
    { tag_name: 'アドベンチャー' },
    { tag_name: 'FPS' },
    { tag_name: 'RPG'},
    { tag_name: 'その他'}
  ]
)

Customer.create!(
  [
    {email: 'game1@example.com', password: '111111', last_name: '佐藤', first_name: '蓮', last_name_kana: 'サトウ', first_name_kana: 'レン', introduction: 'ゲーム大好きです！FPS!!', nickname: 'れん', is_active: true},
    {email: 'game2@example.com', password: '222222', last_name: '鈴木', first_name: '陽翔', last_name_kana: 'スズキ', first_name_kana: 'ハルト', introduction: 'RPGが好きです。', nickname: 'はる', is_active: true},
    {email: 'game3@example.com', password: '333333', last_name: '高橋', first_name: '紬', last_name_kana: 'タカハシ', first_name_kana: 'ツムギ', introduction: '下手だけどそれでもゲーム好き！', nickname: 'つむつむ', is_active: true},
    {email: 'game4@example.com', password: '444444', last_name: '田中', first_name: '陽葵', last_name_kana: 'タナカ', first_name_kana: 'ハルナ', introduction: 'はじめまして。仲良くしてください。', nickname: 'たなか', is_active: true},
    {email: 'game5@example.com', password: '555555', last_name: '伊藤', first_name: '湊', last_name_kana: 'イトウ', first_name_kana: 'ミナト', introduction: '周りに一緒にゲームしてくれる人がいないのでたくさん絡んでください。', nickname: 'みなと', is_active: true},
    {email: 'game6@example.com', password: '666666', last_name: '渡辺', first_name: '悠真', last_name_kana: 'ワタナベ', first_name_kana: 'ユウマ', introduction: 'レトロゲームが得意。', nickname: 'なべ', is_active: true},
    {email: 'game7@example.com', password: '777777', last_name: '山本', first_name: 'さくら', last_name_kana: 'ヤマモト', first_name_kana: 'サクラ', introduction: '面白いゲーム探しています。', nickname: 'さくらひらひら', is_active: true},
    {email: 'game8@example.com', password: '888888', last_name: '中村', first_name: '凛', last_name_kana: 'ナカムラ', first_name_kana: 'リン', introduction: 'パズルゲームくらいしかできん。', nickname: 'リンリン', is_active: true},
    {email: 'game9@example.com', password: '999999', last_name: '小林', first_name: '隼人', last_name_kana: 'コバヤシ', first_name_kana: 'ハヤト', introduction: 'FPS得意になりたい・・・。', nickname: 'こば', is_active: true},
    {email: 'game0@example.com', password: '000000', last_name: '加藤', first_name: '明那', last_name_kana: 'カトウ', first_name_kana: 'アキナ', introduction: '仲間になろう！', nickname: 'あっきーな', is_active: true},
  ]
)

Game.create!(
  [
    {customer_id: 1, game_title: 'はじめまして', game_body: 'なにか面白いゲーム教えてください！', created_at: 'Thu, 25 May 2023'},
    {customer_id: 1, game_title: 'このゲーム面白い', game_body: '＊＊＊っていうゲームに最近はまっているんですけど、プレイしている人いる？', created_at: 'Fri, 26 May 2023'},
    {customer_id: 1, game_title: '助けて～', game_body: '〇〇〇の＊章のボス強すぎる。コツとかあれば教えてください！', created_at: 'Sat, 27 May 2023'},
    {customer_id: 1, game_title: 'ありがとうございます！', game_body: '皆さんのおかげでクリアできました～。次は何のゲームしようかなあ。', created_at: 'Sun, 28 May 2023'},
    {customer_id: 1, game_title: '楽しみ', game_body: '次の＊＊＊のイベント参加することにした！仲間できるかなあ。', created_at: 'Mon, 29 May 2023'},
    {customer_id: 2, game_title: 'やばすぎ', game_body: '新作のRPBのグラフィック良すぎて泣いてる。', created_at: 'Thu, 25 May 2023'},
    {customer_id: 2, game_title: 'どきどき', game_body: 'これから最終章！終わってほしくなさ過ぎて永遠散歩してた。', created_at: 'Sat, 27 May 2023'},
    {customer_id: 2, game_title: '感動の嵐', game_body: 'ついにクリアした。何も言葉はいらない。続編に期待。', created_at: 'Mon, 29 May 2023'},
    {customer_id: 3, game_title: 'こんにちは！', game_body: 'ゲームが下手でも楽しめるゲーム教えてください！', created_at: 'Sun, 28 May 2023'},
    {customer_id: 3, game_title: 'こんにちは！！', game_body: '下手すぎて逆に面白いって友達に言われたので胸張っていきます。', created_at: 'Mon, 29 May 2023'},
    {customer_id: 4, game_title: 'どうも', game_body: 'はじめまして。たなかといいます。仲良くしてください。', created_at: 'Mon, 29 May 2023'},
    {customer_id: 5, game_title: '一緒に！', game_body: 'ぼっちです！仲間募集してます！', created_at: 'Mon, 29 May 2023'}
  ]
)

Event.create!(
  [
    {event_title: "テスト1", event_body: "この投稿はテスト1です。", start_time: 'Wed, 31 May 2023 20:30:00', finish_time: 'Wed, 31 May 2023 21:30:00'},
    {event_title: "テスト2", event_body: "この投稿はテスト2です。", start_time: 'Mon, 5 Jun 2023 19:00:00', finish_time: 'Mon, 5 Jun 2023 21:30:00'},
    {event_title: "テスト3", event_body: "この投稿はテスト3です。", start_time: 'Sun, 11 Jun 2023 14:30:00', finish_time: 'Sun, 11 Jun 2023 18:00:00'},
    {event_title: "テスト4", event_body: "この投稿はテスト4です。", start_time: 'Fri, 23 Jun 2023 20:00:00', finish_time: 'Fri, 23 Jun 2023 23:00:00'},
    {event_title: "テスト5", event_body: "この投稿はテスト5です。", start_time: 'Wed, 28 Jun 2023 18:30:00', finish_time: 'Wed, 28 Jun 2023 21:30:00'}
  ]
)
