class MascotaController < ApplicationController
  before_action :set_mascotum, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Catalogo", :mascota_path

  # GET /mascota
  # GET /mascota.json
  def index

    fuentesina()
    @loguin = logueado();
    @count= 0
    @countTwo = 1
    if request.post?
      if defined? params[:sexoFind] and params[:edadFind] and params[:tamanoFind]
        @mascota = Mascotum.where(sexo: params[:sexoFind], edad: params[:edadFind], tamano: params[:tamanoFind]).paginate(:page => params[:page], per_page: 8 )
      end
    else
      #@mascota = Mascotum.all
      @mascota = Mascotum.all.paginate(:page => params[:page], per_page: 8 )
    end
  end

  # GET /mascota/1
  # GET /mascota/1.json
  def show
    add_breadcrumb "Mascota #{@mascotum.id}", :mascotum_path
    fuentesina()
    @loguin = logueado();
  end

  # GET /mascota/new
  def new
    if permiso_admin() == false
      redirect_to root_path;
    end
    fuentesina()
    @mascotum = Mascotum.new
  end

  # GET /mascota/1/edit
  def edit
    fuentesina()
    add_breadcrumb "Mascota #{@mascotum.id}", @mascotum
    add_breadcrumb "Editar Mascota #{@mascotum.id}", edit_mascotum_path(@mascotum)
    if permiso_admin() == false
      redirect_to root_path;
    end
    fuentesina()
    @loguin = logueado();
  end

  # POST /mascota
  # POST /mascota.json
  def create
    @mascotum = Mascotum.new(mascotum_params)

    respond_to do |format|
      if @mascotum.save
        format.html { redirect_to @mascotum, notice: 'success&La mascota fue creada correctamente.' }
        format.json { render :show, status: :created, location: @mascotum }
      else
        format.html { render :new }
        format.json { render json: @mascotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mascota/1
  # PATCH/PUT /mascota/1.json
  def update
    respond_to do |format|
      if @mascotum.update(mascotum_params)
        format.html { redirect_to @mascotum, notice: 'info&La mascota fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @mascotum }
      else
        format.html { render :edit }
        format.json { render json: @mascotum.errors, status: :unprocessable_entity }
      end
    end
  end
  #serna123
  # DELETE /mascota/1
  # DELETE /mascota/1.json
  def destroy
    if permiso_admin() == true
      @mascotum.destroy
      respond_to do |format|
        format.html { redirect_to mascota_url, notice: 'warning&La mascota fue eliminada correctamente.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path;
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

  # Use callbacks to share common setup or constraints between actions.
  def set_mascotum
    @mascotum = Mascotum.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mascotum_params
    params.require(:mascotum).permit(:sexo, :edad, :tamano, :raza, :image)
  end

  def logueado
    if sesion_identi() and defined?(@current_user_id)
      return true;
    else
      return false;
    end
  end
end
