# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: %i[create edit update destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

def set_search
  @search = Play.includes(image_attachment: [:blob]).ransack(params[:q]) 
  @search_plays = @search.result.page(params[:page])
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
