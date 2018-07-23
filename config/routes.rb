Rails.application.routes.draw do
	root to: "subscribers#index"
  resources :subscribers
end
