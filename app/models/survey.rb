class Survey < ApplicationRecord
  belongs_to :user

  has_many :survey_responses, dependent: :destroy
  has_many :survey_question_responses, through: :survey_responses
  has_one :survey_question, dependent: :destroy

  accepts_nested_attributes_for :survey_question

  validates_presence_of :title, :survey_question

  # Next Iteration:
  # There is a better way to handle stats calculations like this
  # Either through a db trigger that updates a stats table (probably not, but it's possible)
  # Or through another datastore like that we can toss stats into the handle calculations
  # Mongodb comes to mind, I think you can have indexes on a mongo collection that calculate stats in the background
  def yes_percentage
    return nil unless survey_responses.any?
    BigDecimal(survey_question_responses.yes_responses.size) / BigDecimal(survey_responses.size) * BigDecimal(100)
  end

  def no_percentage
    return nil unless survey_responses.any?
    BigDecimal(100) - yes_percentage
  end
end
