class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_pramas)
    if task.save
      flash[:notice] = "タスクを作成しました"
      redirect_to root_path
    else
      flash.now[:alert] = "タスクを作成できませんでした"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash[:notice] = "タスクを更新しました"
      redirect_to tasks_show_path
    else
      flash.now[:alert] = "タスクを更新できませんでした"
      render :edit
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
