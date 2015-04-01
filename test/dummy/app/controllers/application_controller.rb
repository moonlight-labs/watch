class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def watch
    target = params[:type].constantize.find(params[:id])

    raise 'could not find target object' if target.nil?

    case params[:state]
    when 'on'
      current_user.watch(target)
    when 'off' 
      current_user.unwatch(target)
    else
      raise 'State must be on or off'
    end

      
    render json: {
      result: 'ok',
      target: target
    }
  end

  def me
    render json: current_user
  end

  def current_user
    @@current_user ||= User.first
  end

end
