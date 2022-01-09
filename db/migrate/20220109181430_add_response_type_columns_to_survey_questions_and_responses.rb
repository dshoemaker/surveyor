class AddResponseTypeColumnsToSurveyQuestionsAndResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :survey_questions, :response_type, :integer
    add_column :survey_question_responses, :response_type, :integer
  end
end
