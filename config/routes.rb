Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  root to: "home#index"

  devise_for :customers, controllers: {
    sessions: 'customers/sessions'
  }

  devise_for :makers, controllers: {
    sessions: 'makers/sessions'
  }

  resources :evaluates do
    resources :maker_comments
    resources :customer_comments
  end

  resources :products
  resources :makers
  resources :customers
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

end
