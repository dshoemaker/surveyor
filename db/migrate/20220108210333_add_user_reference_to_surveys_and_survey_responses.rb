class AddUserReferenceToSurveysAndSurveyResponses < ActiveRecord::Migration[6.1]
  def change
    add_reference :surveys, :user
    add_reference :survey_responses, :user
  end
end
