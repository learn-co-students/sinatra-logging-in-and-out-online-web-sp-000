require 'spec_helper'

describe 'ApplicationController' do
  describe "GET '/'" do
    it "returns a 200 status code" do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it "contains a form for a user to log in" do
      get '/'
      expect(last_response.body).to include("<input")
    end
  end

  describe "GET '/logout'" do
    
    it 'redirects to \'/\'' do
      get '/logout'
      follow_redirect!
      expect(last_request.path_info).to eq('/')
    end

  end

end
