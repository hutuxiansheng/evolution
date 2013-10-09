#encoding: utf-8
class ExamFeedbacksController < ApplicationController
  def new
    #TODO:fix if user has access exam 
    @exam = Examination.find(params[:examination_id])
    @exam_feedback = ExaminationFeedback.new
    respond_to do |f|
      f.html
    end
  end

  def edit

  end

  def show
    @exam = Examination.find(params[:examination_id])
    @exam_feedback = ExaminationFeedback.find(params[:id])
    #@paper = @exam.check_user_paper(@exam_feedback.id)
  end

  def create
    @exam = Examination.find(params[:examination_id])
    @exam_feedback = @exam.feedbacks.find_by_user_id(current_user.id)
    if @exam_feedback.nil?
      @exam_feedback = @exam.feedbacks.create!(:user_id => current_user.id)
    end
    @exam.exam_question_answere(@exam_feedback.id)
    respond_to do |format|
      if @exam_feedback
        #fix me submit paper
        @exam.finish_paper(@exam_feedback.id, params[:answer])
        format.html { redirect_to examinations_path, :notice => "考试结束！"}
      else
        format.html { redirect_to examinations_path, :notice => "考试系统出错！"}
      end
    end
  end

  def index
    if current_user.admin?
      @exam = Examination.find(params[:examination_id])
    else
    end
  end

  def update
    if current_user.admin?
      @exam = Examination.find(params[:examination_id])
      unless @exam.nil?
        @exam_feedback = @exam.feedbacks.find(params[:id])
        mode = params[:examination_feedback][:state].eql?("true") ? true : false
        @exam_feedback.update_attribute(:state, mode)
      end
    end
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { head :no_content }
    end
  end

end
