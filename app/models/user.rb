class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :confirmable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :remember_me, :password, :password_confirmation
  
  has_many :tasks, :dependent => :destroy
  has_many :lists, :dependent => :destroy
  validates_uniqueness_of :email, :username  
  validates_presence_of :email, :username, :password, :password_confirmation
end
