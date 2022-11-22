# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  full_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  validates :full_name, presence: true

  has_many :books
end
