# frozen_string_literal: true

Rails.application.routes.draw do
  resource :user
  resource :session, only: %i[create]
  resource :refresh, only: %i[create]
end
