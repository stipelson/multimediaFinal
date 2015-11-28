class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path

  def index
    fuentesina()
    add_breadcrumb "Catalogo", :mascota_path
    add_breadcrumb "Usuarios", :users_path

    if permiso_admin();
      redirect_to :controller => "mascota", :action => "index";
      @users = User.all()
      if params[:tipo];
        @tipo = params[:tipo];
      end
    else
      redirect_to :controller => "mascota", :action => "index";
    end
  end

  def show
    fuentesina()
    if regular() or permiso_admin();

      @user = User.find(params[:id]);
    else
      redirect_to :controller => "mascota", :action => "index";
    end
  end

  def new
    fuentesina()
    if regular();

      redirect_to :controller => "mascota", :action => "index";
    else
      @user = User.new();
    end
  end

  def edit
    fuentesina()
    add_breadcrumb "Catalogo", :mascota_path
    add_breadcrumb "Perfil #{@user.usuario}", user_path(params[:id]);

    logueado();

    @user = User.find(params[:id]);
    @nombre = @user.nombre;
    @tel = @user.tel;
    @dir = @user.dir;
    @departamento = @user.departamento;
    @ciudad = @user.ciudad;
    @tipoid = @user.tipoid;
    @numeroid = @user.numeroid;
    @fnacimiento = @user.fnacimiento;
    @usuario = @user.usuario;
    @password = @user.password;

    @admin = @user.admin;
  end

  def create
    logueado();

    @user = User.new(user_params)
    if @user.save()
      @nombre_u = params[:user][:nombre];
      redirect_to users_path, :notice => "success&El usuario #{@nombre_u} ha sido creado";
    else
      render "new";
    end

  end

  def update
    logueado();

    if @user.update(user_params)
      @nombre_u = params[:user][:nombre];
      redirect_to users_path, :notice => "info&El usuario #{@nombre_u} ha sido actualizado"
    else
      render "edit";
    end
  end

  def destroy
    if permiso_admin();
      @user = User.find(params[:id]);
      if @user.destroy()
        redirect_to users_path, :notice => "info&El usuario ha sido eliminado";
      else
        redirect_to users_path, :notice => "warining&El usuario NO ha podido ser eliminado";
      end
    else
      redirect_to :controller => "inicio", :action => "index";
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nombre,:tipoid, :numeroid, :fnacimiento, :departamento, :ciudad, :tel, :dir, :usuario, :password, :admin)
  end


  def regular
    if sesion_identi() and (!defined?(@permiso_admin) or !@permiso_admin)
      return true;
    else
      return false;
    end
  end

  def permiso_admin
    if sesion_identi() and defined?(@permiso_admin) and @permiso_admin
      return true;
    else
      return false;
    end
  end

  def logueado
    if sesion_identi()
      return true;
    else
      return false;
    end
  end
end
