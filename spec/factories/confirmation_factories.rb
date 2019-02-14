FactoryBot.define do
  factory :confirmation do
    association :bixo, factory: :bixo
  end
end
