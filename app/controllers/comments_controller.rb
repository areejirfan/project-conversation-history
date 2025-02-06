class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
      @project = Project.find(params[:project_id])
      @comment = @project.comments.new(comment_params.merge(user: current_user))
      if @comment.save
        respond_to do |format|
            flash[:notice] = "Comment created successfully"
            format.turbo_stream
            format.html { redirect_to @project }
        end
      else
        redirect_to @project, alert: "Comment could not be created"
      end
    end
  
    private
    def comment_params
      params.require(:comment).permit(:content)
    end
  end