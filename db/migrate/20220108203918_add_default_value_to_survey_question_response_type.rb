class AddDefaultValueToSurveyQuestionResponseType < ActiveRecord::Migration[6.1]
  def change
    change_column_default :survey_question_responses, :type, 0
    change_column_null :survey_question_responses, :type, false
  end
end
