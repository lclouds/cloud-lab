CloudLab::Application.routes.draw do
  root to: 'static_pages#home'
  resources :users do
    member do
      get :myclasses
    end
  end
  resources :courses
  resources :clclasses do
    member do
       put 'apply'
    end 
    resources :lectures
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :teacher_sessions, only: [:new, :create, :destroy]
  devise_for :administrators

  # scope '(:locale)' do
    resources :teachers
  # end
  

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match '/teacher_signup',  to: 'teachers#new'
  match '/teacher_signin',  to: 'teacher_sessions#new'
  match '/teacher_signout', to: 'teacher_sessions#destroy', via: :delete
  match '/teacher',  to: 'teacher_sessions#new'

  match '/teacher_root', to: 'teachers#home'
  match '/teachers_clclasses', to: 'teachers#clclasses'

  match '/help',    to: 'static_pages#help'
  match '/terms',   to: 'static_pages#terms'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/sysadmin',to: 'sys_admin#index'
  mount Ckeditor::Engine => '/ckeditor'
  
  match '/error_auth', to: 'static_pages#unauth'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
