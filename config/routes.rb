Rails.application.routes.draw do
  root to: 'pages#index'

  post 'mob_db/upload' => 'mobdb#upload'
  get 'mob_db/edit' => 'mobdb#edit'
end
