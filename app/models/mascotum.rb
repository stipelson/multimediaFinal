class Mascotum < ActiveRecord::Base

  has_attached_file :image, styles: { small: "150x150>", medium: '300x300>', large: '600x600>' }
  validates_attachment :image,
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
  validates :image, presence: {message: '... es requerido seleccionar una imagen'}  

  #validates :email , presence: true , confirmation: true
  #validates :email_confirmation, presence: { message: " es requerido"}

  # Validamos en una expresion regular nuestro email
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" }

  # Validamos que el identificador tenga entre 8 a 12 caracteres
  #validates :identificador, length: { in: 8..12 , message: "debe tener entre 8 y 12 caracteres"}

  # Validamos que el identificador solo sea numerico
  #validates :identificador, numericality: { only_integer: true }

  # Validamos que el email sea unico
  #validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :edad, numericality: {only_integer: true, message: "... el campo debe ser numerico"}
  validates :edad, length: { in: 0..10 , message: "... debe tener maximo 30 caracteres"}
  validates :raza, presence: { message: "... es requerido"}, length: { in: 0..20 , message: "... debe tener maximo 20 caracteres"}
end
