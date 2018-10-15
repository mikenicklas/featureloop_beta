class SubdomainConstraint   
  def self.matches?(request)
    request.subdomain.present? && !Apartment::Elevators::Subdomain.excluded_subdomains.include?(request.subdomain)   
  end 
end 

Rails.application.routes.draw do
  devise_for :users

  constraints SubdomainConstraint do     
    root "features#index"
    resources :features, only: [:new, :create, :show]
  end

  root "dashboard#index"
  resources :products, only: [:new, :create, :show]
end
