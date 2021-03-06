class ApplicationController < ActionController::API
  # include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session
  helper_method :current_user

  def current_user
    if session[:user_id]
      return @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      json_response('You are not authorized to access this feature')
    end
  end

  def authorize_conversation(user, conversation)
    if current_user.id != conversation.user1_id && current_user.id != conversation.user2_id
      json_response('You are not authorized to access that feature.')
    end
  end

end
