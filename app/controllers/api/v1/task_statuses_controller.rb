class Api::V1::TaskStatusesController < ApplicationController
  before_action :set_task_status, only: [:show, :update, :destroy]

  def index
    task_statuses = TaskStatus.all
    render json: task_statuses
  end

  def show
    render json: @task_status
  end

  def create
    task_status = TaskStatus.new(task_status_params)
    if task_status.save
      render json: task_status, status: :created
    else
      render json: { errors: task_status.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @task_status.update(task_status_params)
      render json: @task_status
    else
      render json: { errors: @task_status.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task_status.destroy
    head :no_content
  end

  private

  def set_task_status
    @task_status = TaskStatus.find_by(description: params[:description])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Task status not found" }, status: :not_found
  end

  def task_status_params
    params.require(:task_status).permit(:status, :user_id, :update_date, :description)
  end
end
