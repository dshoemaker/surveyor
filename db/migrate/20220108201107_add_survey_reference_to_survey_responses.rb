class AddSurveyReferenceToSurveyResponses < ActiveRecord::Migration[6.1]
  def change
    add_reference :survey_responses, :survey
  end
end
