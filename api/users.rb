module Acme
  class Users < Grape::API
    version 'v1'
    format :json

    resource :users do
      get do
        {:users => User.all.pluck(:name)}
      end
      post do
        user = User.create!(name: params[:name])
        {:user => {:name => user.name}}
      end

    end
  end
end
