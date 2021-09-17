Rails.application.routes.draw do
  root to: "books#index"
  resources :books, only:[:show, :new, :create, :edit, :update, :destroy]
  get 'books' => "books#books" #TOP
  # get 'book/show/:id' => "books#show" #詳細画面
  # post '/book' => "books#create" #新規登録
  # get 'book/:id/edit' => "books#edit" #編集画面
  # patch 'book/:id/update' => "books#update"
  # post 'book/:id/update' => "books#update" #更新
  # delete 'book/:id' => 'books#destroy' #削除

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
