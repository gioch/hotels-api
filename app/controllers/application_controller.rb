class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ActionController::ParameterMissing, with: :show_exception_errors
  rescue_from ActiveRecord::RecordNotFound, with: :show_exception_errors

  def default_serializer_options
    { root: false }
  end

protected

  def show_exception_errors(e)
    render json: { errors: [e] }, status: :unprocessable_entity
    return
  end
end
