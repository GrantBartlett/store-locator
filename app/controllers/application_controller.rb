class ApplicationController < ActionController::Base
  before_action :require_user
  before_action :require_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def correct_user
    @user = User.find(params[:id])
    if !is_admin?
      unless current_user == @user
        redirect_to(root_url)
      end
    end
  end

  def require_admin
    if !current_user.admin?
      redirect_to(root_url)
      flash[:error] = "Dang it! You don't have permission to do this!"
    end
  end

  def require_user
    redirect_to(root_url) unless logged_in?
  end

  # Before every request, we set the locale, from the specified or detected settings, or from the cookie
  def set_locale
    if language_change_necessary?
      I18n.locale = the_new_locale
      set_locale_cookie(I18n.locale)
    else
      use_locale_from_cookie
    end
  end

  # A locale change is necessary if no locale cookie is found, or if the locale param has been specified
  def language_change_necessary?
    return cookies['locale'].nil? || params[:locale]
  end

  # The new locale is taken from the current_user language setting, it logged_in, or from the http accept language header if not
  # In both cases, if a locale param has been passed, it takes precedence. Only available locales are accepted
  def the_new_locale
    new_locale = (params[:locale] || I18n.default_locale )
    ['en', 'ar'].include?(new_locale) ? new_locale : I18n.default_locale.to_s
  end

  # Sets the locale cookie
  def set_locale_cookie(locale)
    cookies['locale'] = locale.to_s
  end

  # Reads the locale cookie and sets the locale from it
  def use_locale_from_cookie
    I18n.locale = cookies['locale'] || I18n.default_locale
  end
end
