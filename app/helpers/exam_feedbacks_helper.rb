# encoding: utf-8
module ExamFeedbacksHelper
  def  exam_feedback_state(state)
    case state
    when nil
      "待批阅"
    else
      "查看结果"
    end
  end

  def exam_feedback_title(state)
    case state
    when nil
      "等待处理"
    else
      "考试结果"
    end
  end

  def exam_feedback_result(state)
    case state
    when true
      "考试已通过"
    when false
      "考试未通过"
    end
  end
end
