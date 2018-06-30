Rails.application.routes.draw do
  devise_for :users
  root 'home#top'

  resources :users, only: [:show, :edit]

  get 'home/index'
  get 'users/management'
  get 'impressions/wrote'   => 'impressions#wrote'
  get '/books' => 'books#content'
  get '/books/:id/title_edit' => 'books#title_edit', as: 'title_edit_book'
  get '/books/:id/arasuji_edit' => 'books#arasuji_edit', as: 'arasuji_edit_book'
  get '/chapters/:id/chapter_edit' => 'chapters#chapter_edit', as: 'chapter_edit_chapter'
  get 'impressions/new_create' => 'impressions#new_create'
  get 'users/:id/impression' => 'users#impression', as: 'user_impression'
  delete 'users/:user_id/impression/:id' => 'impressions#destroy', as: 'impression'
  resources :books, only: [:new, :create, :index, :show, :edit, :arasuji, :update, :subtitle, :subchapter,:destroy] do
    resources :impressions, only: [:new, :index, :written, :create]
    resources :chapters
  end

end
