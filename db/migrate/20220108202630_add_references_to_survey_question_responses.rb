class AddReferencesToSurveyQuestionResponses < ActiveRecord::Migration[6.1]
  def change
    add_reference :survey_question_responses, :survey_response
    add_reference :survey_question_responses, :survey_question
  end
end
