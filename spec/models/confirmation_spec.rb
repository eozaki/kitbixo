require 'rails_helper'

RSpec.describe Confirmation, type: :model do
  it { should belong_to(:bixo) }
end
