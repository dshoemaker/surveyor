class User < ApplicationRecord
  has_many :surveys
  has_many :survey_questions, through: :surveys
  has_many :survey_responses
  has_many :survey_question_responses, through: :survey_responses
end
