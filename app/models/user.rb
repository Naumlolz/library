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
class User < ApplicationRecord
  has_one_attached :avatar

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, confirmation: true

  has_many :comments, dependent: :destroy
  has_many :users_books, dependent: :destroy
  has_many :books, through: :users_books
end
