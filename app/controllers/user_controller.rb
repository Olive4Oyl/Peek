class UserController < ApplicationController
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    if params[:name] == "" || params[:email] == "" || params[:password_digest] == ""
      #flash message enter something into the fields
      # flash[:message] = "You are missing a field."
      redirect to '/users/signup'
    else
      submitted_email = params[:email]
      if submitted_email.match(VALID_EMAIL_REGEX) != nil
        User.all.each do |user|
          if user.email == submitted_email
            redirect to '/users/login'
            #flash message saying this email has an account
          end
        end
        @user = User.create(params)
        session[:id] = @user.id
        redirect '/users/home'
      else
        #put a flash message saying enter a valid email
        redirect to '/users/signup'
      end
    end
  end


  get '/users/login' do
    erb :'/users/login'
  end

post '/users/login' do
  if params[:email] == "" || params[:password_digest] == ""
    #flash message enter something into the fields
    redirect to '/'
  else
    location = {}
    output = JSON.parse(open('http://ipinfo.io').read)

    location[:city] = output["city"].to_s
    location[:zip_code] = output["postal"].to_s
    location.to_s

    @user = User.find_by(params)

    @user.city = location[:city]
    @user.zip_location = location[:zip_code]
    @user.save
    if !@user.nil?
      session[:id] = @user.id
      redirect '/users/home'
    else
      redirect to '/users/login'
    end
  end
end

get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

  get '/users/logout' do
    session.clear
    redirect to '/'
  end

end
