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
  @task = Task.new(set_params_tasks)
  if @task.save!
    redirect_to @task
  end
end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  if @task.update(set_params_tasks)
    redirect_to @task
  else
    render :edit
  end
end

def destroy
  @task = Task.find(params[:id])
  if @task.delete
    redirect_to @task
  else
    render :index
  end
end

end

private

def set_params_tasks
  params.require(:task).permit(:title, :details, :boolean)
end
