## ■ サービス概要
- 現在、電話とLINEで予約を受け付けている整骨院でWebアプリを用いた予約システムを導入し、予約受付の効率化と患者さんが予約する際の利便性向上を図る

- 整骨院の予約システムにWeb予約を導入し、予約に関する手間を削減する、整骨院に特化した予約サービス

## ■メインのターゲットユーザー
- 患者さんの予約する際の手間を減らしつつ、予約管理を効率化したいと感じている整骨院の院長先生
- 電話予約に抵抗感を持っており、Webで予約したい既存患者さん

## ■ユーザーが抱える課題
- Webから手軽に予約できるようにしたい
- ひと目で予約の空き状況が確認できるようにしたい
- 臨時休診の際、患者さんに通知したい

## ■解決方法
- 患者さんがひと目で予約の空き状況を確認できる
- 確認した空いている予約枠にWebから予約することができる
- 臨時休診の際、患者さんに通知する

## ■実装予定の機能
- 患者さん(ユーザー画面)
  - ユーザーが予約空き状況を確認できる
  - ユーザーが予約の申込、変更、キャンセルできる
  - ユーザーが登録/退会できる
  - ユーザーがLINEと連携できる
  - ユーザーが管理者に問い合わせができる
  - ユーザーが混雑状況を確認できる
- 院長先生(管理画面)
  - 予約患者の検索、一覧、詳細、編集
  - 予約状況の編集ができる
  - 管理者がユーザーに臨時休診の連絡をメールまたはLINEでできる
  - 管理者がユーザーに長期休暇中の開業日時やお知らせなどの連絡をメールまたはLINEでできる
  - 管理者がSNS(facebookやLINEなど)で臨時休診、長期休暇中の開業日時、お知らせなどを共有できる

## ■なぜこのサービスを作りたいのか？
お義兄さんと会話している時、「整骨院の予約アプリ作れる？」という話が上がりました。  
学習を始めた自身の動機が、自分が習得した技術で身近な人の課題を解決したいといったものでしたので、その動機ともマッチしたので作ってみようと思いました。  
また、いつもお世話になっているお義兄さんに恩返しもできるので良い機会だと感じています。

## ■スケジュール
企画〜技術調査：7/31〆切  
README〜ER図作成：8/15 〆切  
メイン機能実装：8/16 - 9/16  
β版をRUNTEQ内リリース（MVP）：9/17  
本番リリース：10/1

## ■画面遷移図
[画面遷移図](https://www.figma.com/file/lQEcnkcNB7vsQtcLOe8gAM/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3_%E6%95%B4%E9%AA%A8%E9%99%A2%E4%BA%88%E7%B4%84%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9?node-id=11%3A21)

## ■ER図
[ER図](https://drive.google.com/file/d/1MEeGrhqYNBva60VBbOu_os8BxVPLskod/view?usp=sharing)

![ReservationService-ページ1 drawio](https://user-images.githubusercontent.com/94113387/187106931-4518a909-e669-4c84-94e7-aceb04441851.png)
