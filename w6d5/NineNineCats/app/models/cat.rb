# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = ['brown', 'white', 'black', 'gray']
  validates :color, inclusion: COLORS
  validates :birth_date, :color, :name, :sex, presence: true 
  validates :sex, inclusion: ["M", "F"]

  def age
    time_ago_in_words(birth_date)
    # now = Time.now.utc.to_date 
    # dob = self.birth_date
    # now.year - dob.year
  end
end