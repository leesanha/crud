Rails.application.routes.draw do

  get 'register/info'

  get 'home/index'

  devise_for :users
  get 'video_board/index'

  get 'video_board/new'

  get 'video_board/create'
  post 'video_board/create'

  get 'video_board/update'
  post 'video_board/update/:id' =>  'video_board#update'

  get 'video_board/edit'
  get 'video_board/edit/:id' => 'video_board#edit'

  get 'video_board/destroy'
  get 'video_board/destroy/:id' => 'video_board#destroy'

  get 'video_board/show'
  get 'video_board/show/:id' =>  'video_board#show'

  get 'reply/create'
  post 'reply/create' 

  get 'reply/destroy'
  get 'reply/destroy/:id' => 'reply#destroy'

  
  get 'post/index'
  get 'post/index/:page' => 'post#index'

  get 'post/new'

  get 'post/create'
  # 메소드가 post니까 post방식으로 보내야함!
  post 'post/create'

  get 'post/update'
  post 'post/update/:id' => 'post#update'

  get 'post/edit'
  get 'post/edit/:id' => 'post#edit'

  get 'post/destroy'
  get 'post/destroy/:id' => 'post#destroy'
  
  get 'post/show'
  # show액션으로 날라오는 id값을 :id에 저장
  get 'post/show/:id' => 'post#show'
  
  get 'post/search'
  
  get 'likes/likes_toggle/:id' => 'likes#likes_toggle'
  post 'likes/likes_toggle:id', to: 'likes#likes_toggle', as: 'knu'
  
  get 'post/ajaxCall' => 'post#ajaxCall'
  # post 'likes/likes_toggle'

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
