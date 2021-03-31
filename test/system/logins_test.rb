require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "Login valido" do
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
    assert_text "Bem vindo"
  end

  test "Login com credenciais invalias" do
    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: "teste@teste.com"
    fill_in "Senha", with: "senhaincorreta"
    click_button "Entrar"

    assert_equal new_session_path,current_path
    assert_text "Email ou senha invalido"
  end
end
