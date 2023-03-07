require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:favorites)}
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :email}
    it { should validate_presence_of :api_key}
  end
end