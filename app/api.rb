module Acme
  class API < Grape::API
    prefix 'api'
    format :json
    mount Acme::Users
  end
end
