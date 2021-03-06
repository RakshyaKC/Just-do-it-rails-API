# frozen_string_literal: true

Rails.application.routes.draw do
  resources :invitations, only: %i[create]
  resources :workouts, except: %i[new edit]
  resources :videos, except: %i[new edit]
  # RESTful routes
  resources :videos, only: %i[show update]
  # Users can only see specific video and update that video as watched.
  resources :examples, except: %i[new edit]
  # Custom video routes
  get 'videos/thirty/alllevels' => 'videos#thirty_min_all_levels_videos'
  get 'videos/thirty/intermediate' => 'videos#thirty_min_intermediate_videos'
  get 'videos/fortyfive/alllevels' => 'videos#fortyfive_min_all_levels_videos'
  get 'videos/fortyfive/intermediate' => 'videos#fortyfive_min_intermediate_videos'
  get 'videos/sixty/alllevels' => 'videos#sixty_min_all_levels_videos'
  get 'videos/sixty/intermediate' => 'videos#sixty_min_intermediate_videos'
  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  patch '/change-fitness' => 'users#changefitness'
  delete '/delete' => 'users#destroy'
end
