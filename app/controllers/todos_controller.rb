class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      redirect_to todos_path, notice: 'exito'
    else
      redirect_to todos_path, notice: 'error'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
