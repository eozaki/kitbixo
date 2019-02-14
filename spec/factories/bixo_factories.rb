FactoryBot.define do
  factory :bixo do
    nome { 'Erick Cordeiro Ozaki' }
    email { 'erick.ozaki@usp.br' }
    telefone { '11111111111' }
    curso { Bixo.cursos[:LIC] }
    tutorship { true }
  end
end
