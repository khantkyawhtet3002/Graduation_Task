require 'rails_helper'

describe 'customer', type: :system do
  context 'Customer new registration test' do
    it 'カスタマー登録成功' do
      visit new_customer_registration_path
      fill_in 'Full name', with: 'test_1'
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end

    it 'カスタマー登録失敗（氏名未入力）' do
      visit new_customer_registration_path
      fill_in 'Full name', with: ''
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content 'Full name translation missing: ja.activerecord.errors.models.customer.attributes.full_name.blank'
     end 

    it 'カスタマー登録失敗（メールアドレス未入力）' do
      visit new_customer_registration_path
      fill_in 'Full name', with: 'test_1'
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content 'Email translation missing: ja.activerecord.errors.models.customer.attributes.email.blank'
     end

    it 'カスタマー登録失敗（パスワード未入力）' do
      visit new_customer_registration_path
      fill_in 'Full name', with: 'test_1'
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content 'Password translation missing: ja.activerecord.errors.models.customer.attributes.password.blank'
    end

    it 'カスタマー登録失敗（確認用パスワードが違う）' do
      visit new_customer_registration_path
      fill_in 'Full name', with: 'test_1'
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'passwordpassword'
      click_button 'SIGN UP'
      expect(page).to have_content 'Password confirmation translation missing: ja.activerecord.errors.models.customer.attributes.password_confirmation.confirmation'
    end
  end

  context 'Login test' do
    before do
      FactoryBot.create(:customer)
    end

    it 'ログイン成功' do
      visit new_customer_session_path
      fill_in 'Email', with: 'kangmin11@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      expect(page).to have_content "KangMin'S PROFILE"
    end

    it 'ログイン失敗（メールアドレスが違う）' do
      visit new_customer_session_path
      fill_in 'Email', with: 'kangmin@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      expect(page).to have_content 'CUSTOMER LOGIN'
    end

    it 'ログイン失敗（パスワードが違う）' do
      visit new_customer_session_path
      fill_in 'Email', with: 'kangmin11@gmail.com'
      fill_in 'Password', with: 'passwordpassword'
      click_button 'LOGIN'
      expect(page).to have_content 'CUSTOMER LOGIN'
    end

    it 'ログアウト成功' do
      visit new_customer_session_path
      fill_in 'Email', with: 'kangmin11@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      click_on 'LOGOUT'
      expect(page).to have_content 'ログアウトしました'
    end

    it 'メールアドレス変更' do
      visit new_customer_session_path
      fill_in 'Email', with: 'kangmin11@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      click_on 'CHANGE LOGIN INFO, DELETE ACC'
      fill_in 'Email', with: 'kangmin@gmail.com'
      fill_in 'Current password', with: 'password'
      click_button 'UPDATE'
      expect(page).to have_content 'アカウント情報を変更しました。'
    end

    it 'パスワード変更' do
      visit new_customer_session_path
      fill_in 'Email', with: 'kangmin11@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      click_on 'CHANGE LOGIN INFO, DELETE ACC'
      fill_in 'Password', with: 'passpass'
      fill_in 'Password confirmation', with: 'passpass'
      fill_in 'Current password', with: 'password'
      click_button 'UPDATE'
      expect(page).to have_content 'アカウント情報を変更しました。'
    end
  end
end
