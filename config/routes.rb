Rails.application.routes.draw do
  resources :users
    get 'test' => 'users#testSession'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	post 'authenticate', to: 'authentication#authenticate'
	#resources :users
end
