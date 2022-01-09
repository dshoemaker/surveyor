class CreateSurveyQuestionResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_question_responses do |t|
      t.boolean   :binary_response
      t.integer   :type
      t.timestamps
    end
  end
end
