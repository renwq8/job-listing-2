Rails.application.routes.draw do
  devise_for :users

  resources :jobs do
    resources :resumes
  end

resources :welcome do
end

resources :jobs do
    collection do
      get :search
    end
  end
  
  root 'welcome#index'

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end

      resources :resumes
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
