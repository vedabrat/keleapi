require 'httparty'

 class Kele
   include HTTParty
   base_uri 'https://www.bloc.io/api/v1'

   def initialize(email, password)
    response = self.class.post('/sessions', body: {
         "email": email,
         "password": password
      })
     puts response.code
     raise "Invalid Email or Password. Try Again." if response.code == 404
     @auth_token = response["auth_token"]
   end
 end
