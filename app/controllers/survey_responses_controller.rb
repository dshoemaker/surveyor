class SurveyResponsesController < ApplicationController
  before_action :set_survey
  before_action :set_survey_response, only: %i[ show edit update destroy ]

  def index
    # TODO: Pagination (will_paginate/kaminari or some cursor based pagination) is needed here.
    #       Don't want to load the entire collection into memory
    @survey_responses = @survey.survey_responses
  end

  def show
  end

  def new
    @survey_response = SurveyResponse.new(user_id: current_user.id, survey_id: @survey.id)
    @survey_response.build_survey_question_response
  end

  def create
    # Next Iteration: Create a service object that constructs a valid survey response
    @survey_response = current_user.survey_responses.build(survey_response_params)
    @survey_response.survey = @survey
    @survey_response.survey_question_response.survey_question = @survey.survey_question

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to survey_responses_url(@survey), notice: "Response Recorded" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @survey_response.build_survey_question_response unless @survey_response.survey_question_response
  end

  def update
    respond_to do |format|
      if @survey_response.update(survey_response_params)
        format.html { redirect_to survey_response_url(@survey_response), notice: "Response updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey_response.destroy

    respond_to do |format|
      format.html { redirect_to survey_response_url(@survey), notice: "Responsed was successfully deleted." }
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def set_survey_response
    @survey_response = SurveyResponse.find(params[:id])
  end

  def survey_response_params
    params.require(:survey_response).permit(survey_question_response_attributes: [:binary_response])
  end
end
