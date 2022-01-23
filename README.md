## About
アニメ視聴管理が簡単にできるwebアプリ『アニスナップ』


## How to use


## Function


## Use Library
### Front
Awesome Font, jQuery, Ajax

### Database
SQLite3

### Gemfile  
| Gem | Purpose |
|:---|:---:|
|SQLite |データベース |
|devise |画像処理 |
|carriewave |画像処理 |
|mini-magick |ユーザー機能 |
|kaminari |ページネーション |
|friendly_id |ユーザーID |
|ransack |検索機能 |
|impressionist |ビュー数管理 |
|chartkick |評価グラフで使用 |
|other |please read Gemfile |



## In the future
著作権上問題のあるアニメのキービジュアルをサムネイル画像として使用することを改善し、機械学習を用いてオススメ作品を表示させてデプロイしたい。  
Ruby on Railsを使ってて思ったのがgemが豊富で楽に機能を追加していけるが、処理が重いのと柔軟性に欠けると感じたのでシンプルにLaravelを使うか、JSをバックエンドで用いて作り直したほうが良い気がした...。  
