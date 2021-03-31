require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  
  test "teste de cadastro de usuário" do
    visit root_path
    click_on "Cadastre-se"
    fill_in "Nome", with: "Renato Soares"
    fill_in "E-mail", with: "teste@teste.com"
    fill_in "Senha", with: "teste@123"
    fill_in "Confirmação de senha", with: "teste@123"
    click_on "Cadastrar"
    assert_text "Cadastro realizado com sucesso!"  
  end

  test "Cadastrar dados errados" do
    visit root_path
    click_on "Cadastre-se"
    click_on "Cadastrar"
    assert_text "Erro ao salvar"
  end
end
