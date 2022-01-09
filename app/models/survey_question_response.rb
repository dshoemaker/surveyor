class SurveyQuestionResponse < ApplicationRecord
  self.ignored_columns = %i(type)
  include HasResponseType

  belongs_to :survey_response
  belongs_to :survey_question

  scope :yes_responses, -> { where(binary_response: true) }
  scope :no_responses, -> { where(binary_response: false) }
end
