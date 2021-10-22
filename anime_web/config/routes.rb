Rails.application.routes.draw do

  devise_for :users, controllers: {
   registrations: 'users/registrations',
   #他にもカスタマイズするコントローラーがあればここに記述する
 }
  get 'posts/anime/search' => 'ranking#search'
  get 'posts/anime/:id' => 'posts#page'
  get 'posts/anime/:id/episode' => 'posts#episode'
  get 'posts/anime/:id/items' => 'posts#items'
  get 'posts/anime/:id/review=:state_id' => 'posts#otherkansou'
  post 'posts/review/destroy_post/:destroy_id' => 'posts#destroy_post'


  #ランキング
  get 'ranking/weekly=:ranking_select' => 'ranking#weekly'
  get 'ranking/total=:ranking_select' => 'ranking#total'
  get 'ranking/:year/:season=:ranking_select' => 'ranking#ranking'
  get 'ranking/choice' => 'ranking#choice'

  #記事検索
  get 'news/search' => 'news#search'
  get 'news' => 'news#all'
  get 'news/category/anime' => 'news#anime'
  get 'news/category/goods' => 'news#goods'
  get 'news/category/event' => 'news#event'
  get 'news/category/decision' => 'news#decision'
  get 'news/:id' => 'news#article'

  #ユーザー関連
  get 'user/:id' => 'user#index'
  get 'setting/profile' => 'setting#profile'
  post 'setting/update' => 'setting#update'

  #送信しましたリザルト
  get 'singup/result' => 'setting#result'

  #ステータス
  post 'state/:id/create/:state_id' => 'states#create'
  post 'state/:id/destroy' => 'states#destroy'
  #ステータス（可変）
  post 'state/active/:id/create/:state_id' => 'states#create_active'
  post 'state/active/:id/destroy' => 'states#destroy_active'
  #ステータス（スマホ）
  post 'state/:id/create_mobile/:state_id' => 'states#create_mobile'
  post 'state/:id/create_mobile_act/:state_id' => 'states#create_mobile_act'

  #感想いいね
  post 'postlike/:review_id/create/:state' => 'postlike#create'
  post 'postlike/:review_id/destroy' => 'postlike#destroy'

  get 'user/:id/post' => 'user#post'
  get 'user/:id/post/review=:review_anime_id' => 'user#review'
  post 'user/:id/post/review=:review_anime_id' => 'user#review'
  #ウォッチリスト
  get 'user/:id/mylist/watch' => 'user#watch'
  get 'user/:id/mylist/watched' => 'user#watched'
  get 'user/:id/mylist/wanna_watch' => 'user#wanna_watch'
  get 'user/:id/mylist/watch_hold' => 'user#watch_hold'
  get 'user/:id/mylist/watch_drop' => 'user#watch_drop'
  get '/contacts' => 'contacts#new'
  post '/contacts' => 'contacts#create'
  #resource :contacts, only: [:new, :create]

  #アニメ投稿
  get 'mg/anime' => 'update#index'
  post 'mg/anime' => 'update#new'
  get 'mg/search' => 'update#search'
  post 'mg/search' => 'update#search'
  get 'mg/anime/edit/:id' => 'update#edit'
  post 'mg/anime/edit/:id' => 'update#low'

  get '/privacy' => 'home#privacy'
  get '/terms' => 'home#terms'

  get '/' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
