# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  subject { response.status }

  describe 'GET /signup' do
    before { get '/signup' }

    it { is_expected.to be 200 }
  end

  describe 'POST /users' do
    let(:params) { { user: { email: email, password: password, password_confirmation: password_confirmation } } }
    let(:email) { 'email@provider.com' }
    let(:password) { 'whatever_password' }
    let(:password_confirmation) { password }

    before { post '/users', params: params }

    it { is_expected.to be 302 }

    context 'when email is nil' do
      let(:email) { nil }

      it { is_expected.to be 422 }
    end

    context 'when email is not an email' do
      let(:email) { 'nil' }

      it { is_expected.to be 422 }
    end

    context 'when email is empty' do
      let(:email) { '' }

      it { is_expected.to be 422 }
    end

    context 'when email is blank' do
      let(:email) { ' ' }

      it { is_expected.to be 422 }
    end

    context 'when password is nil' do
      let(:password) { nil }

      it { is_expected.to be 422 }
    end

    context 'when password is empty' do
      let(:password) { '' }

      it { is_expected.to be 422 }
    end

    context 'when password is blank' do
      let(:password) { ' ' }

      it { is_expected.to be 422 }
    end

    context 'when password confirmation is different than password' do
      let(:password_confirmation) { 'different_password' }

      it { is_expected.to be 422 }
    end

    context 'when password confirmation is nil' do
      let(:password_confirmation) { nil }

      it { is_expected.to be 422 }
    end

    context 'when password confirmation is empty' do
      let(:password_confirmation) { '' }

      it { is_expected.to be 422 }
    end

    context 'when password confirmation is blank' do
      let(:password_confirmation) { ' ' }

      it { is_expected.to be 422 }
    end
  end
end
