# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  age        :integer
#  email      :string           not null
#  first_name :string           not null
#  gender     :string
#  last_name  :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns the created user' do
    user = build(:user, first_name: 'Petr', last_name: 'Petrov')

    expect(user)
  end
end
