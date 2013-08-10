CloudLab::Application.routes.draw do

  get "password_resets/new"

  root to: 'static_pages#home'
  resources :users do
    member do
      get :myclasses
      get :search_user
    end
  end
  resources :courses
  resources :clclasses do
    member do
      put 'apply'
    end
    resources :exercises do
      member do
        get 'new_report', to: 'exercises#new_report'
        post 'reports', to: 'exercises#reports'
        get '/report/:report_id', to: 'exercises#show_report', as: 'show_report'
        get '/reports/:submission', to: 'exercises#show_reports', as: 'show_reports'
        # put '/report/:report_id', to: 'exercises#update_report'
        # get '/report/:report_id/edit'
        delete '/report/:report_id', to: 'exercises#destroy_report', as: 'destroy_report'
      end
    end
    resources :lectures do
      resources :exercises
      member do
        get 'new_video'
        get '/v/:video_id', to: 'lectures#show_video', as: "show_video", requirements: { :video_id => /^d+/ }
        put '/v/:video_id', to: 'lectures#update_video', as: "update_video"
        delete '/v/:video_id', to: 'lectures#destroy_video', as: "destroy_video"
        get '/v/:video_id/edit', to: 'lectures#edit_video', as: "edit_video"
        post 'videos'
      end
    end
  end

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resources :teams do
    member do
      put :join
      delete :leave
      get :show_team
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :teacher_sessions, only: [:new, :create, :destroy]
  devise_for :administrators
  resources :password_resets

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
  match '/teachers_courses', to: 'teachers#courses'

  match '/help',    to: 'static_pages#help'
  match '/terms',   to: 'static_pages#terms'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/news', to: 'static_pages#news'

  mount Ckeditor::Engine => '/ckeditor'

  match '/sysadmin',to: 'sys_admin#index'
  match '/error_auth', to: 'static_pages#unauth'
# match '*a' => redirect("/404.html")

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

