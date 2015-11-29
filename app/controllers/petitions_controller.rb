class PetitionsController < ApplicationController

  def index
    if permiso_admin()
      fuentesina()
      @petitions = Petition.all
      @enEspera = @petitions.where(aprobada: nil)
      @rechazadas = @petitions.where(aprobada: false)
    else
      redirect_to petitions_indexuser_path
    end
  end

  def indexuser
    if logueado()
      fuentesina()
      @user = User.find(@current_user_id)
      @petitions = Petition.where(user: @user)
      @enEspera = @petitions.where(aprobada: nil)
      @rechazadas = @petitions.where(aprobada: false)
    else
      redirect_to mascota_path
    end
  end

  def new
    #redirect_to edit_mascotum_path(params[:mascota])
    if logueado()
      @user = User.find(@current_user_id)
      if defined? params[:mascota]
        @mascota = Mascotum.find(params[:mascota])
        @petition = Petition.new()
        @petition.mascotum = @mascota
        @petition.user = @user
        @petition.vista = false

        if @petition.save()
          redirect_to mascotum_path(params[:mascota]), :notice => "success&La peticion ha sido enviada, puedes revisar su estado en la seccion adopciones";
        else
          render "new";
        end
      else
        redirect_to :controller => "login", :action => "iniciar_sesion";
      end
    else
      redirect_to :controller => "login", :action => "iniciar_sesion";
    end

  end

  def rechazar
    if permiso_admin()
      @petition = Petition.find(params[:petition])
      @petition.aprobada = false

      if @petition.save
        redirect_to admin_petitions_path, :notice => "info&La peticion fue rechazada"
      else
        render "index";
      end
    else
      redirect_to petitions_indexuser_path
    end

  end

  private

  def permiso_admin
    if sesion_identi() and defined?(@permiso_admin) and @permiso_admin
      return true;
    else
      return false;
    end
  end

  def logueado
    if sesion_identi() and defined?(@current_user_id)
      return true;
    else
      return false;
    end
  end

end
