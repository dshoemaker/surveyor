module ResponseTypeHelper
  def response_input_for(form, survey_question)
    case survey_question.response_type.to_sym
    when :yes_no
      form.label(:binary_response, survey_question.content) + \
        form.collection_radio_buttons(:binary_response, yes_no_collection, :first, :last) do |builder|
          builder.label { builder.radio_button + " " + builder.text }
        end
    when :open_response
      # todo for open text responses on survey questions
      # would look something like this:
      #
      # form.label :response_content, survey_question.content
      # form.text_area :response_content
      raise 'NotImplemented'
    when :multi_choice
      # TODO for multiple choice questions
      # This is a dealers choice situation. Either check boxes of custom radios
      # depending on whether the surveyor wants one and only one selection, or multiple choices
      #
      # would look something like the following:
      #
      # form.label :multi_choice_response, survey_question.content
      # form.collection_check_boxes :multi_choice_response, survey_question.custom_fields, :custom_field_id, :content
      raise 'NotImplemented'
    else
      raise 'Fallen through the switch!'
    end
  end

  def yes_no_collection
    [['1', 'yes'], ['0', 'no']]
  end
end
