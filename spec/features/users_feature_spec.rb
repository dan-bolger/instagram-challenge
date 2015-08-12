require 'rails_helper'

require_relative 'helpers.rb'
include Helpers

feature "user can sign in and sign out" do
  context "user not signed in and on the homepage" do
    it "should see 'sign in' and 'sign up' buttons" do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' button" do
      visit '/'
      expect(page).not_to have_button('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end