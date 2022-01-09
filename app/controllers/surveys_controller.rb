class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy responses]

  def index
    # Hoping to speed up our calculations for yes/no responses by preloading relevant survey_question_responses
    # To avoid this page from falling over we'd eventually want to select only the values we need from the models
    # as also paginate to avoid loading every record at the same time.
    @surveys = Survey.includes(survey_responses: :survey_question_response).all
  end

  def show
  end

  def new
    @survey = Survey.new(user_id: current_user.id)
    @survey.build_survey_question
  end

  def create
    @survey = current_user.surveys.build(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to surveys_url, notice: "Survey was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @survey.build_survey_question unless @survey.survey_question
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to survey_url(@survey), notice: "Survey was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "Survey was successfully deleted." }
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, survey_question_attributes: [ :content])
  end
end
