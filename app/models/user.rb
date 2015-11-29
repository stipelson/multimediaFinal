class User < ActiveRecord::Base
  has_many :petition

  validates_uniqueness_of :usuario, :case_sensitive => false, :message => "... ya esta en uso"

  #validates :email , presence: true , confirmation: true
  #validates :email_confirmation, presence: { message: " es requerido"}

  # Validamos en una expresion regular nuestro email
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" }
  validates_format_of :nombre, :with => /\A[[:alpha:][-A-z]]+\Z/, message: "... el campo solo debe contener letras", length: { in: 0..20 , message: "... debe tener maximo 20 caracteres"}
  validates_format_of :departamento, :with => /\A[[:alpha:][-A-z]]+\Z/, message: "... el campo solo debe contener letras"
  #/^[[:alpha:]\s'"\-_&@!?()\[\]-]*$/u
  validates_format_of :ciudad, :with => /\A[[:alpha:][-A-z]]+\Z/, message: "... el campo solo debe contener letras"

  # Validamos que el identificador tenga entre 8 a 12 caracteres
  #validates :identificador, length: { in: 8..12 , message: "debe tener entre 8 y 12 caracteres"}

  # Validamos que el identificador solo sea numerico
  #validates :identificador, numericality: { only_integer: true }

  # Validamos que el email sea unico
  #validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :numeroid, numericality: {only_integer: true, message: "... el campo debe ser numerico"}
  validates :tel, numericality: {only_integer: true, message: "... el campo debe ser numerico"}

  #validates :raza, presence: { message: " es requerido"}, length: { in: 0..20 , message: " debe tener maximo 20 caracteres"}
end
