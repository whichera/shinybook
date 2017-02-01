class User < ActiveRecord::Base
    validates_presence_of :username, :email, :password
    validates_presence_of :password_confirmation
    validates_confirmation_of :password_confirmation
    validates_presence_of :username
    validates_uniqueness_of :email, :username
    
    has_many :boxes
    has_many :pokemons
end