# spec/helpers/application_helper_spec.rb
require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#nav_helper' do
    let(:style) { 'nav-link' }
    let(:tag_type) { 'li' }

    it 'returns navigation links' do
      allow(helper).to receive(:nav_items).and_return([
        { url: root_path, title: 'Home' },
        { url: proposers_path, title: 'Proponentes' }
      ])
      allow(helper).to receive(:active?).and_return('active')

      expected_output = "<li><a href='#{root_path}' class='#{style} active'>Home</a></li>" +
                        "<li><a href='#{proposers_path}' class='#{style} active'>Proponentes</a></li>"

      expect(helper.nav_helper(style, tag_type)).to eq(expected_output)
    end
  end

  describe '#nav_items' do
    it 'returns an array of navigation items' do
      expect(helper.nav_items).to eq([
        { url: root_path, title: 'Home' },
        { url: proposers_path, title: 'Proponentes' }
      ])
    end
  end

  describe '#login_helper' do
    let(:style) { 'faker-css-class' }

    context 'when user is signed in' do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(true)
      end

      it 'returns edit profile and logout links' do
        expect(helper.login_helper(style)).to include('Edit Perfil')
        expect(helper.login_helper(style)).to include('Logout')
      end
    end

    context 'when user is not signed in' do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(false)
      end

      it 'returns register and login links' do
        expect(helper.login_helper(style)).to include('Register')
        expect(helper.login_helper(style)).to include('Login')
      end
    end
  end

  describe "#alerts" do
    context "when flash messages are present" do
      before do
        flash[:notice] = 'This is a notice'
        flash[:alert] = 'This is an alert'
      end

      it "returns toastr flash messages" do
        expect(helper.alerts).to include("toastr.success('This is a notice')")
        expect(helper.alerts).to include("toastr.error('This is an alert')")
      end
    end
  end
end
