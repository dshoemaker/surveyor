Rails.application.routes.draw do
  root to: 'surveys#index'

  resources :users
  resources :surveys do
    # note on `path:` option:
    # we want SurveyResponse as the domain object, but our path to be survey/:survey_id/responses
    # note on our `as:` option:
    # this makes our helpers readable (eg survey_responses instead of survey_survey_responses for the index path)
    resources :survey_responses, path: 'responses', as: :responses
  end
end
