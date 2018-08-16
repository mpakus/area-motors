# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    resources :enquiries, only: %i[index create update show]
    resources :customers, only: %i[index show] do
      resources :notes, only: %i[create]
    end
  end
  root 'web/enquiries#index'
end
