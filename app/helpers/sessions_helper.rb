module SessionsHelper
  def surrent_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    current_user.present?
  end

  def destroy
    session.delete(:uder_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
