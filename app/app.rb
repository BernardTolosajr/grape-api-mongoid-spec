module Acme
  class App
    def self.instance
       run Acme::App.new
    end
  end

  def call(env)
    Acme::API.call(env)
  end
end
