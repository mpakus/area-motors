# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    resources :enquiries, only: %i[index create update show]
  end
  root 'web/enquiries#index'
end
