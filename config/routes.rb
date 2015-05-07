Rails.application.routes.draw do
    root 'videos#index'
    
    resources :videos
    resources :directors
    resources :members
    resources :videoforrents
    resources :rentalagreements
    
    get '/query1', to: 'reports#query1', as: :q1
    get '/query2', to: 'reports#query2', as: :q2
    get '/query3', to: 'reports#query3', as: :q3
    get '/query4', to: 'reports#query4', as: :q4
    get '/query5', to: 'reports#query5', as: :q5
    get '/query6', to: 'reports#query6', as: :q6
    get '/query7', to: 'reports#query7', as: :q7
    get '/query8', to: 'reports#query8', as: :q8
    get '/query9', to: 'reports#query9', as: :q9
    get '/query10', to: 'reports#query10', as: :q10
    get '/query11', to: 'reports#query11', as: :q11
    get '/query12', to: 'reports#query12', as: :q12
    get '/query13', to: 'reports#query13', as: :q13
    get '/query14', to: 'reports#query14', as: :q14
    get '/query15', to: 'reports#query15', as: :q15
    get '/query16', to: 'reports#query16', as: :q16
    
    
end
