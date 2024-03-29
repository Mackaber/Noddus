Noddus::Application.routes.draw do

  resources :vacantes

  match '/practicantes/:id' => 'practicantes#show'
  match '/practicantes' => 'practicantes#practicantes'

  match '/empresas/:id' => 'empresas#show'
  match '/empresas' => 'empresas#empresas'

  get 'tags/practicantes/:tag', to: 'practicantes#practicantes', as: :tag_practicantes
  get 'tags/empresas/:tag', to: 'empresas#index', as: :tag_empresas
  get 'tags/vacantes/:tag', to: 'vacantes#index', as: :tag_vacantes

  match '/vacantes/aplicar/:vacante_id' => 'aplicacions#aplicar'
  match '/vacantes/aceptar/:aplicacion_id' => 'aplicacions#aceptar'

  match '/empresas/follow/:empresa_id' => 'empresas#follow'
  match '/practicantes/follow/:practicante_id' => 'practicantes#follow'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"} do
    get '/users/sign_in' => 'devise/sessions#create'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

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
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
