require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns the created user' do
    user = build(:user, first_name: 'Petr', last_name: 'Petrov')

    expect(user)
  end
end