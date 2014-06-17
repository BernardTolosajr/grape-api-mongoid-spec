require 'spec_helper'

describe Acme::Users do
  def app
    Acme::API
  end

  it "works" do
    users = create_list(:user, 3) 
    
    get "/api/v1/users"

    body = last_response.body

    results = []
    3.times { |x| results << "bernard" }

    response = {"users" => results}.to_json
    expect(body).to eq response
  end

  it "POST" do
    post "/api/v1/users", {:name => "Bernard"}

    body = last_response.body

    expect(last_response.status).to be 201
    expect(body).to eql({:user => {:name => "Bernard"}}.to_json)
  end
end
