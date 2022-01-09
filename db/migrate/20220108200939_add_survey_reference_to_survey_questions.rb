class AddSurveyReferenceToSurveyQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :survey_questions, :survey
  end
end
