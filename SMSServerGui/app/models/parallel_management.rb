class ParallelManagement < ActiveRecord::Base
    def before_save
      #self.password = ParallelManagement.hash_password( self.password )
    end
    
    def after_create
        @password=nil
    end
    def try_to_login
       ParallelManagement.login( self.user_name,self.password )
    end

    private
    def self.hash_password( password )
      Digest::SHA1.hexdigest( password )
    end
    def self.login( name,password )
       hashed_password = hash_password( password || '' )
       find( :first,:conditions => [ "user_name =? and password =?",name,hashed_password] )
    end
    has_many :buildings
end
