# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for Users' do
  subject { get '/signup' }

  it { is_expected.to route_to('users#new') }
end
