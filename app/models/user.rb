class User < ActiveRecord::Base
   has_secure_password

   has_many :gardens, dependent: :destroy
   has_many :notes, through: :gardens
   
end
