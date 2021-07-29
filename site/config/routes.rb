Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  namespace :api do
    namespace :v1 do
      # root to: redirect('whiskeys#index')
      get 'whiskeys/index'
      # post 'whiskeys', action: :create, controller: 'whiskeys'
      post 'whiskeys', to: 'whiskeys#create'
      delete 'whiskeys/:id', to: 'whiskeys#destroy'
    end
  end
  get 'pages/info'
  get 'pages/landing'

  resources :ideas
  get '/whiskeys' => 'whiskeys#index'

  root to: redirect('/pages/landing')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
