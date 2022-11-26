# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  subject { response.status }

  describe 'POST /sessions' do
    let(:params) { { email: email, password: password } }
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }

    before { post '/sessions', params: params }

    it { is_expected.to be 302 }

    context 'when the user does not exist' do
      let(:email) { 'whatever@email.com' }

      it { is_expected.to be 404 }
    end

    context 'when the email is not provided' do
      let(:email) { nil }

      it { is_expected.to be 404 }
    end

    context 'when the email is empty' do
      let(:email) { '' }

      it { is_expected.to be 404 }
    end

    context 'when the email is blank' do
      let(:email) { ' ' }

      it { is_expected.to be 404 }
    end

    context 'when the password is wrong' do
      let(:password) { 'whatever' }

      it { is_expected.to be 404 }
    end

    context 'when the password is not provided' do
      let(:password) { nil }

      it { is_expected.to be 404 }
    end
  end

  describe 'DELETE /logout' do
    let(:user) { create(:user) }

    before { post '/sessions', params: { email: user.email, password: user.password } }

    it { expect { delete '/logout' }.to change { session[:user_id] }.from(user.id).to(nil) }
  end
end
