class SurveyResponse < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  has_one :survey_question_response, dependent: :destroy

  accepts_nested_attributes_for :survey_question_response

  validates_presence_of :survey_question_response
end
