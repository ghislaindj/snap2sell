Snap2sell::Application.routes.draw do
  scope :format => true, :constraints => { :format => 'json' } do
    resources :products
  end
  get '/products'     => 'home#index'
  get '/products/:id' => 'home#index'
  root to: 'home#index'
end
