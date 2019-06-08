class CommentsController < ApplicationController
  before_action :load_task
  
  def index
    if params[:parent_comment_id].present?
      @comments = Comment.replies(params[:parent_comment_id], params[:parent_page])
      params[:parent_page] = @comments.next_page
    else
      @comments = @task.parent_replies.paginate(page: params[:page], per_page: 5)
    end
  end
  
  def new
    @parent_comment_id = params[:parent_comment_id]
  end
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to task_path(@task)
  end
  
  private
  
  def load_task
    @task = Task.find(params[:task_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content,:user_id,:task_id,:parent_comment_id)
  end
end