class UserController < ApplicationController

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    if params[:name] == "" || params[:email] == "" || params[:password_digest] == ""
      flash[:message] = "Please fill in all categories"
      redirect to '/users/signup'
    else
      submitted_email = params[:email]
      if submitted_email.match(VALID_EMAIL_REGEX) != nil
        User.all.each do |user|
          if user.email == submitted_email
            flash[:message] = "It looks like you already have an account"
            redirect to '/users/login'

          end
        end
        @user = User.create(params)
        session[:id] = @user.id
        new_gif = Giphy.search('creepy cat', {limit: 50, offset: 25})
        new_gif = new_gif[rand(0..49)].embed_url.to_s

        http = HTTPClient.new
        scraped_img_link = Nokogiri::HTML(http.get_content(new_gif))

        scraped_img_link = scraped_img_link.css("a").css("img").css("#gif")[0].values[2]

        @user.profile_pic = scraped_img_link



        location_hash = {}
        output = JSON.parse(open('http://ipinfo.io').read)

        location_hash[:city] = output["city"]
        location_hash[:zip_code] = output["postal"]
        location_hash.to_s
        @current_location = Location.find_or_create_by(city: location_hash[:city])
        @current_location.users << @user
        @user.save
        redirect '/users/home'
      else
        flash[:message] = "Please enter a valid email address"
        redirect to '/users/signup'
      end
    end
  end


  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do
    if params[:email] == "" || params[:password_digest] == ""
      flash[:message] = "Please fill in all categories"
      redirect to '/users/login'
    else

    @user = User.find_by(params)

    if !@user.nil?
      @user.save
      session[:id] = @user.id
      location_hash = {}
      output = JSON.parse(open('http://ipinfo.io').read)
      location_hash[:city] = output["city"]
      location_hash[:zip_code] = output["postal"]
      location_hash.to_s
      @current_location = Location.find_or_create_by(city: location_hash[:city])
      @current_location.users << @user
      redirect '/users/home'
    else
      flash[:message] = "Looks like you don't have an account. Sign up here"
      redirect to '/users/signup'
    end
  end
end

get '/users/home' do
  location_hash = {}
  output = JSON.parse(open('http://ipinfo.io').read)

  location_hash[:city] = output["city"]
  location_hash[:zip_code] = output["postal"]
  location_hash.to_s

  @current_location = Location.find_or_create_by(city: location_hash[:city])

  @user = User.find(session[:id])
  @user.location_id = @current_location.id
  @current_location_posts = Post.where('location_id = ?',@current_location.id)
  flash[:message] = "Welcome Back!"
    erb :'/users/home'
  end


  get '/users/logout' do
    @user = User.find_by(id: session[:id])
    @current_location = Location.find_by(id: @user.location_id)
    @current_location.users.delete(@user)
    session.clear
    flash[:message] = "Bye!"
    redirect to '/'
  end

  get '/users/update_profile' do
    erb :'/users/update'
  end


  post "/users/updated" do
    @user = User.find_by(id: session[:id])
    @user.email = params[:email]
    @user.password_digest = params[:password_digest]
    @user.save
    flash[:message] = "Your information has been updated!"
    redirect '/users/home'
  end


end

#***************************************************
#Login

# <!-- <h2>Welcome back you creep</h2>
# <% if flash.has?(:message) %>
#   <%= flash[:message] %>
# <% end %>
#
# <form method=POST action="/users/login">
#   <p>Email: <input type="text" name="email"></p>
#   <p>Password: <input type="password" name="password_digest"></p>
#   <p><button type="submit">Sign In</button></p>
# </form> -->

#***************************************************
#Post/View.erb

# 
# <!-- this is the forumn page that just displays the forumn it
# does not let you comment without the pressing on the href link to reply
# which directs you to the comment/new route
# <%Like.all.each do |current_like| %>
# <% if current_like.posts.include?(@post) %>
# <% @like = current_like %>
#
# <% end %>
# <%end%>
# <%Dislike.all.each do |current_dislike| %>
#   <%if current_dislike.posts.include?(@post)%>
#   <%@dislike = current_dislike%>
#   <%end%>
# <%end%>
#
#
#
# <br></br>
# <%=@post.content%>
# <br><br>
#
# <%@post.comments.each do |comment|%>
# <%=comment.content%>
# <%end%>
# <a href="/posts/<%=@post.id%>/new_like">Like</a>:)<%=@like.users.length%>
#
#
#
# <br></br>
# <a href="/posts/<%=@post.id%>/new_dislike">Dislike</a><%=@dislike.users.length%>
#
# <a href="/comments/<%=@post.id%>/new">Comment</a>
# <br></br>
#
# <%@user = User.find_by(id: session[:id])%>
# <% if @post.user_id == @user.id%>
# <a href="/posts/<%=@post.id%>/edit">Edit Post</a>
# <a href="/posts/<%=@post.id%>/delete">Delete Post</a>
# <%end%>
#
#
# <br></br>
# <a href="/users/home">Back</a> -->
