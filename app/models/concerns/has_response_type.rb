module HasResponseType
  extend ActiveSupport::Concern

  included do
    enum response_type: {
      yes_no: 0,
      open_response: 1, # Both of these options are unused, I wanted to highlight my reasoning
      multi_choice: 2   # for types as well as the unused columns on survey_question_response
    }
  end
end
