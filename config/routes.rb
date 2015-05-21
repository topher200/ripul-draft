RipulDraft::Application.routes.draw do
  root :to => "draft#index"

  resources :next_pick_numbers
  resources :baggages
  resources :picks
  resources :players
  resources :teams

  get "draft" => "draft#index"

  get "admin" => "application#set_admin"
end
