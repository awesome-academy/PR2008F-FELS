# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  result      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
class Lesson < ApplicationRecord
  WORDS_NUMBER = 10

  belongs_to :user
  has_many :lesson_words
  belongs_to :category
  accepts_nested_attributes_for :lesson_words

end
