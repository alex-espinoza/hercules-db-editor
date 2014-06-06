Rails.application.routes.draw do
  root to: 'pages#index'

  post 'mob_db' => 'mobdb#upload'
end
