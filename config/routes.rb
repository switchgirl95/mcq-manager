Rails.application.routes.draw do
  get 'sessions/new'
  get  '/signups',  to: 'students#new'
  get  '/signupt',  to: 'teachers#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/signups',  to: 'students#create'
  post '/signupt',  to: 'teachers#create'
  get '/mysubjects', to: 'subjects#mysub'
  get '/myresults', to: 'subjects#myres'
  get '/mytests', to: 'teachers#mytests'
  get '/testperf', to: 'teachers#testperf'

  get   '/tests/:test_id/evaluations/new', to: 'evaluations#new'
  #get '/evaluations/:test_id/new' to: 'evaluations#new'
  
mathjax 'mathjax'
  resources :evaluations
  resources :fokeys
  resources :totos
  resources :teachers
  resources :clazzs
  resources :students
  resources :gives_tests
  resources :completeds
  resources :tests do
  collection do
      post :import
    end
  end
  resources :questions
  resources :answers
  resources :departments do
  collection do
      post :import
    end
  end
  resources :subjects

  post 'login/verify'
  #get 'student/index'
  match ':controller(/:action(/:id))',:via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
end
