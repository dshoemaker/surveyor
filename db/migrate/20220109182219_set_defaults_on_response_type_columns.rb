class SetDefaultsOnResponseTypeColumns < ActiveRecord::Migration[6.1]
  def change
    # we would also want to backfill these columns prior to doing this.
    change_column_default :survey_question_responses, :response_type, 0
    change_column_null :survey_question_responses, :response_type, false
    change_column_default :survey_questions, :response_type, 0
    change_column_null :survey_questions, :response_type, false
  end
end
