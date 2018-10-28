class SubdomainConstraint   
  def self.matches?(request)
    request.subdomain.present? && !ExcludedSubdomains.include?(request.subdomains.first)
  end 
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  constraints SubdomainConstraint do     
    root "features#index"
    resources :features, only: [:new, :create, :show] do
      resources :upvotes, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
  end

  root "dashboard#index"
  resources :products, only: [:new, :create, :show]
end
