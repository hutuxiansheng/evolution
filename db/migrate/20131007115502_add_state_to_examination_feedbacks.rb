class AddStateToExaminationFeedbacks < ActiveRecord::Migration
  def change
    add_column :examination_feedbacks, :state, :boolean
  end
end
