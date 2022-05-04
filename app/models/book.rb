# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  has_one_attached :avatar

  validates :title, :description, presence: true

  paginates_per 6

  has_many :comments
  has_many :users_books
  has_many :users, through: :users_books
end
