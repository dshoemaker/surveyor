class AddDefaultValueToSurveyQuestionType < ActiveRecord::Migration[6.1]
  def change
    change_column_default :survey_questions, :type, 0
    change_column_null :survey_questions, :type, false
  end
end
