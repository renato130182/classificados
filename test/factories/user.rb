FactoryBot.define do
    factory :user do
        name {"Renato"}
        sequence(:email){|n| "teste#{n}@teste.com"}
        password {"password"}
        password_confirmation {"password"}
    end
end