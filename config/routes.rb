# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    resources :enquiries, except: %i[destroy]
  end
  root 'web/enquiries#index'
end
