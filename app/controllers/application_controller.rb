class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def fuentesina

    if session[:fuenteTamano] != 3 or 4 or 5 or 2 or defined?! session[:fuenteTamano]
      @fuente_nav = "4"
    end
    @fuente_nav = session[:fuenteTamano]
    if @fuente_nav == '5'
      @btn = ""
      @fuente_normal = "7"
      @fuente_titulo = "4"
    elsif @fuente_nav == "4"
      @btn = "btn-lg"
      @fuente_normal = "6"
      @fuente_titulo = "4"
    elsif @fuente_nav == "3"
      @btn = "btn-lg"
      @fuente_normal = "4"
      @fuente_titulo = "3"
    elsif @fuente_nav == "2"
      @btn = "btn-lg"
      @fuente_normal = "4"
      @fuente_titulo = "2"
    elsif @fuente_nav == "2"
    else
      @btn = "btn-lg"
      @fuente_normal = "3"
      @fuente_titulo = "2"
    end
  end

  private

  def get_login
    #Verifica si el usuario está logueado. Primero pregunta si existe la session[:logueado] y además que este sea true, si existe devuelve la sesión sino existe devuelve false.
    if defined?(session[:logueado]) and session[:logueado]
      #Está logueado.
      return session;
    else
      #No está logueado.
      return false;
    end
  end

  def sesion_identi
    @sesion = get_login();
    if @sesion
      @current_nombre = @sesion[:nombre];
      @current_nombre.capitalize!
      @permiso_admin = @sesion[:admin];
      @current_user_id = @sesion[:usuario_id]
      return true;
    else
      return false;
      #redirect_to :controller => "login", :action => "iniciar_sesion";
    end
  end

end
