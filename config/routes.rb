Rails.application.routes.draw do
  #get 'home/search'
  get 'live_items_search/:search_str/:action_name' => 'home#live_items_search', :as => :live_items_search
  get 'search/:action_name' => 'home#search', :as => :search
  post 'search/:action_name' => 'home#search', :as => :view

  get '/services' => 'home#services'

  get 'home/add_item'

  get 'home/logout'

  get 'home/index'
  post 'home/index'

  get 'user/login'
  post 'user/login'
  post 'home/add_item'

  post 'home/add_user'
  get 'home/add_user'


  post 'home/add_category'
  get 'home/add_category'

  get 'home/view_item'
  post 'home/view_item'

  get 'home/borrow'
  post 'home/borrow'

  get 'home/reject'
  post 'home/reject'

  get 'home/approve'
  post 'home/approve'

  get 'home/profile'
  post 'home/profile'

  get '/edit_item/:id' => 'home#edit_item'
  post '/edit_item/:id' => 'home#edit_item'

  get '/delete/:id' => 'home#delete'
  post '/void/:id' => 'home#void'

  get 'home/profile'
  post 'home/profile'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
