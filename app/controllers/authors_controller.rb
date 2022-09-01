class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  wrap_parameters format: []
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def unprocesseable(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocesseable_entity
  end

  def record_not_found invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :not_found
  end
end
