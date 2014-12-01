Rails.application.routes.draw do

  get 'admin/index'
  put 'admin/set_permission'

  resources :profiles, except: [:edit] do
    collection do
      get :edit
    end
    member do
      get :doctor
    end
  end
   
  devise_for :users, :skip => [:registrations] , :controllers => {:registartions => "users/registartions"}

  devise_scope :user do
    delete '/users' => "devise/registrations#destroy", :as => 'user_registration'
    get  'users/sign_up' => 'users/registrations#new'
    get  'users/:id/edit' => 'users/registrations#edit'
    
    # routes for doctor registration/ edit doctors
    get  'doctors/sign_up' => 'users/registrations#new_doctor', :as => 'new_doctor_registration'
    post 'doctors' => 'users/registrations#create', :as => 'doctor_registration'
    get 'doctors/edit' => 'users/registrations#edit_doctor', as: :edit_doctor_registration
    put 'doctors' => 'users/registrations#update'

    # routes for patient registration/ edit patients
    get  'patients/sign_up' => 'users/registrations#new_patient', :as => 'new_patient_registration'
    post 'patients' => 'users/registrations#create', :as => 'patient_registration'
    get  'patients/edit' => 'users/registrations#edit_patient', :as => 'edit_patient_registration'
    put  'patients' => 'users/registrations#update'
  end

  resources :payments, only: [:new, :index] do
    collection do
      get :access_setup
      post :transaction_fees
      put :initiate_payment
    end
  end

  root "pages#home"
  get "about" => "pages#about"
  get 'users/:id' => 'users#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
