# frozen_string_literal: true

module AnyasHanami
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "home.index"
    post "/", to: "home.index", as: :home_create
  end
end
