Rails.application.routes.draw do

  resources :mascota
  resources :users

  get 'login/iniciar_sesion'

  get 'login/cerrar_sesion'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'inicio/index'
  # ActiveRecord::Migration.remove_column :users, :tel

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'inicio#index'

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
  post 'login/iniciar_sesion'
  post 'login/cerrar_sesion'
  post 'mascota/index', to: 'mascota#index', as: 'filter'
  get 'inicio/cambiarFont/:fuenteT', to: 'inicio#cambiarFont', as: 'cambiar_font'

  get 'petitions/index', to: 'petitions#index', as: 'admin_petitions'
  get 'petitions/new/:mascota', to: 'petitions#new', as: 'new_petition'
  get 'petitions/indexuser'
  get 'petitions/rechazar/:petition', to: 'petitions#rechazar', as: 'petition_rechazar'

end
