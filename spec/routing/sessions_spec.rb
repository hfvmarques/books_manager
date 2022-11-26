# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Sessions' do
  describe 'GET /login' do
    subject { get '/login' }

    it { is_expected.to route_to('sessions#new') }
  end

  describe 'POST /sessions' do
    subject { post '/sessions' }

    it { is_expected.to route_to('sessions#create') }
  end

  describe 'DELETE /logout' do
    subject { delete '/logout' }

    it { is_expected.to route_to('sessions#destroy') }
  end
end
