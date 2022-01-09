class AddTypeToSurveyQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :survey_questions, :type, :integer
  end
end
