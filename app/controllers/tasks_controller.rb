class TasksController < ApplicationController
  def index
    @tasks = Task.preload(:status, :priority).all
    sort_tasks
    search_tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'タスクを作成しました'
      redirect_to task_path(@task)
    else
      flash.now[:alert] = 'タスクを作成できませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'タスクを更新しました'
      redirect_to task_path
    else
      flash.now[:alert] = 'タスクを更新できませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'タスクを削除しました'
      redirect_to root_path
    else
      flash.now[:alert] = 'タスクを削除できませんでした'
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status_id, :priority_id)
  end

  def sort_tasks
    if params[:sort]
      sort = params[:sort].to_s.split(',')
      @tasks = @tasks.order(sort[0].to_sym => sort[1].to_sym)
    end
  end

  def search_tasks
    @tasks = @tasks.where('title LIKE ?', "%#{params[:title]}%") if params[:title].present?
    @tasks = @tasks.where(status_id: params[:status_id]) if params[:status_id].present?
  end
end
