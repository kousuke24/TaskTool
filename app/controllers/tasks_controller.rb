class TasksController < ApplicationController
  def index
    @tasks = if params[:sort] == 'create_desc'
               Task.all.order(created_at: :DESC)
             elsif params[:sort] == 'deadline_asc'
               Task.all.order(deadline: :ASC)
             elsif params[:sort] == 'deadline_desc'
               Task.all.order(deadline: :DESC)
             else
               Task.all.order(created_at: :ASC)
             end
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
      redirect_to root_path
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
    params.require(:task).permit(:title, :content, :deadline)
  end
end
