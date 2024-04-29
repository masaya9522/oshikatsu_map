Rails.application.routes.draw do
  resource :map, only: [:show]
  get 'searches/admin'
# 顧客用
# URL /user/sign_in ...
devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: 'homes#top'
   get 'admin' => 'homes#index'

   get "search" => "searches#search"

  end

scope module: :user do
  root to: 'homes#top'

  get "search" => "searches#search"

  #マイページ
  get "customers/mypage" => "customers#show"


  #投稿用
  get 'posts/new'
  post 'posts' => 'posts#create'

  #一覧用
  get 'posts/index'

  #詳細用
  get 'posts.:id' => 'posts#show'

  #編集用
  get 'posts.:id/edit' => 'posts#edit'
  patch 'posts.:id' => 'posts#update'

  #タグの検索で使用する
  get "search_tag" => "posts#search_tag"

  resources :post_comments, only: [:create]

end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
