# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user, email: email, password: password, password_confirmation: password_confirmation) }

  let(:email) { 'email@provider.com' }
  let(:password) { 'whatever password' }
  let(:password_confirmation) { 'whatever password' }

  it { is_expected.to be_valid }

  context 'when email is nil' do
    let(:email) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when email is empty' do
    let(:email) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when email is blank' do
    let(:email) { ' ' }

    it { is_expected.not_to be_valid }
  end

  context 'when email is not an valid email' do
    let(:email) { 'whatever' }

    it { is_expected.not_to be_valid }
  end

  context 'when email is already in use' do
    before { create(:user) }

    it { is_expected.not_to be_valid }
  end

  context 'when password is nil' do
    let(:password) { nil }

    it { is_expected.not_to be_valid }
  end

  context 'when password is empty' do
    let(:password) { '' }

    it { is_expected.not_to be_valid }
  end

  context 'when password is blank' do
    let(:password) { ' ' }

    it { is_expected.not_to be_valid }
  end
end
