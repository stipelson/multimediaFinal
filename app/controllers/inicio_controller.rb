class InicioController < ApplicationController
  def index
    fuentesina()
    @loguin = logueado();
    @count= 0
    @countTwo = 0
    @current_pagina = 1
    #@articles = Article.all.order("created_at DESC")
    #@categories = Category.all.order("created_at ASC")
    #@categoriesFour = @categories.first(4)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def acercade
    fuentesina()

  end

  def cambiarFont
    if defined? params[:fuenteT]
      session[:fuenteTamano] = params[:fuenteT];
      redirect_to root_path;
    else
      redirect_to root_path;
    end
  end

  private

  def logueado
    if sesion_identi() and defined?(@current_user_id)
      return true;
    else
      return false;
    end
  end

end
