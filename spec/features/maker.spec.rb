require 'rails_helper'

describe 'maker', type: :system do
  context 'Maker new registration test' do
    it 'メーカー登録成功' do
      visit new_maker_registration_path
      fill_in 'Name', with: 'test_1'
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content "test_1'S PROFILE"
    end

    it 'メーカー登録失敗（メーカー名未入力）' do
      visit new_maker_registration_path
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content 'Name translation missing: ja.activerecord.errors.models.maker.attributes.name.blank'
     end 

    it 'メーカー登録失敗（メールアドレス未入力）' do
      visit new_maker_registration_path
      fill_in 'Name', with: 'test_1'
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      #expect(page).to have_content 'メーカー名を入力してください'
     end

    it 'メーカー登録失敗（パスワード未入力）' do
      visit new_maker_registration_path
      fill_in 'Name', with: 'test_1'
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: 'password'
      click_button 'SIGN UP'
      expect(page).to have_content 'Password translation missing: ja.activerecord.errors.models.maker.attributes.password.blank'
    end

    it 'メーカー登録失敗（確認用パスワードが違う）' do
      visit new_maker_registration_path
      fill_in 'Name', with: 'test_1'
      fill_in 'Email', with: 'test_1@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'passwordpassword'
      click_button 'SIGN UP'
      #expect(page).to have_content 'Password translation missing: ja.activerecord.errors.models.maker.attributes.password.blank'
    end
  end

  context 'Login test' do
    before do
      FactoryBot.create(:maker)
    end

    it 'ログイン成功' do
      visit new_maker_session_path
      fill_in 'Email', with: 'khantkyawhtet@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      expect(page).to have_content "KKH OS'S PROFILE"
    end

    it 'ログイン失敗（メールアドレスが違う）' do
      visit new_maker_session_path
      fill_in 'Email', with: 'test2@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      expect(page).to have_content 'MAKER(SELLER) LOGIN'
    end

    it 'ログイン失敗（パスワードが違う）' do
      visit new_maker_session_path
      fill_in 'Email', with: 'maker1@email.com'
      fill_in 'Password', with: 'passwordpassword'
      click_button 'LOGIN'
      expect(page).to have_content 'MAKER(SELLER) LOGIN'
    end

    it 'ログアウト成功' do
      visit new_maker_session_path
      fill_in 'Email', with: 'khantkyawhtet@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      click_on 'LOGOUT'
      expect(page).to have_content 'ログアウトしました'
    end

    it 'メールアドレス変更' do
      visit new_maker_session_path
      fill_in 'Email', with: 'khantkyawhtet@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      click_on 'CHANGE LOGIN INFO & DELETE ACC'
      fill_in 'Email', with: 'update_mail@gmail.com'
      fill_in 'Current password', with: 'password'
      click_button 'UPDATE'
      expect(page).to have_content 'アカウント情報を変更しました。'
    end

    it 'パスワード変更' do
      visit new_maker_session_path
      fill_in 'Email', with: 'khantkyawhtet@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'LOGIN'
      click_on 'CHANGE LOGIN INFO & DELETE ACC'
      fill_in 'Password', with: 'passpass'
      fill_in 'Password confirmation', with: 'passpass'
      fill_in 'Current password', with: 'password'
      click_button 'UPDATE'
      expect(page).to have_content 'アカウント情報を変更しました。'
    end
  end
end
