class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      redirect_to todos_path, notice: 'exito'
    else
      redirect_to todos_path, notice: 'error'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'exito'
    else
      redirect_to edit_todo_path(@post), notice: 'intenta denuevo'
    end
  end

  def delete
    @todo = Todo.find(params[:id])
    @todo.delete

    redirect_to todos_path
  end

  def completed
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @terminados = Todo.where(completed:true)
    @sin_terminar = Todo.where(completed:false)
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
