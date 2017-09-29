Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      jsonapi_resources :rates
      jsonapi_resources :service_providers
    end
  end

  root 'pages#home'
end
