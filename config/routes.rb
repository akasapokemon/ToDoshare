Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos
  root 'todos#index'
  get '/:twitter_id' => 'todos#mypage'
  

end
