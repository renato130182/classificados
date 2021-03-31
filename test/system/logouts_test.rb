require "application_system_test_case"

class LogoutsTest < ApplicationSystemTestCase
  test "Realizar logout de usuario" do
    visit root_path
    click_on "Cadastre-se"
    fill_in "Nome", with: "Renato Soares"
    fill_in "E-mail", with: "teste@teste.com"
    fill_in "Senha", with: "teste@123"
    fill_in "Confirmação de senha", with: "teste@123"
    click_on "Cadastrar"
    visit root_path
    click_link "Entrar"
    fill_in "E-mail", with: "teste@teste.com"
    fill_in "Senha", with: "teste@123"
    click_button "Entrar"
    click_button "Sair"
    
    assert_equal new_session_path, current_path
    assert_text "Sessão finalizada"
  end
end
