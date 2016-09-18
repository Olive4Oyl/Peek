class PostController < ApplicationController



  get '/posts/new' do
    @user = User.find_by(id: session[:id])

    @inputed_location = Location.find_by(id: @user.location_id)
    erb :'/posts/new'
  end

    post '/posts/:id/new' do   #this is to create a new post

      if params[:post][:name] == nil || params[:post][:name] == ""

      redirect "/posts/#{params[:id]}/new"
      else
      @post = Post.create(name: params[:post][:name], content: params[:post][:content])
      @user = User.find_by_id(session[:id])
      @location = Location.find_or_create_by(city: params[:id])
      @user.posts << @post
      @post.user =  @user
      @like = Like.new
      @dislike = Dislike.new
      @like.posts << @post
      @dislike.posts << @post
      @like.save
      @dislike.save
      @location.posts << @post

    end

<<<<<<< HEAD
  # get '/posts/view' do

  # end
=======
      erb :"/users/home"

    end



>>>>>>> 3e9d2a919cd4695ecb967adbf2c2195ae4aad2cd


  get '/posts/:id/view' do

    @post = Post.find_by(id: params[:id])

    erb :'/posts/view'
  end



  get '/posts/:id/new_like' do
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(session[:id])

<<<<<<< HEAD
    
    def get_vote
  likes_array = @post.detect{|r| r.id == params[:id].to_i}
  @vote = current_item.votes.find_by_user_id(current_user.id)
  unless @vote
    @vote = Vote.create(:user_id => current_user.id, :value => 0)
    current_item.votes << @vote
  end
  end
    # binding.pry

    if @post.likes_array.include?(@user)
      #flash error message
      #blablablabalabalba
      null
    else
      @post.likes += 1
      @post.likes_array << @user
      @post.save
    end

    if @post.user_id != @post.user.id
      @post.likes += 1
      @post.save
    end
    
    erb :'/posts/view'
=======
    Like.all.each do |current_like|
      if current_like.posts.include?(@post)
        @like = current_like
      end
    end

    Dislike.all.each do |current_dislike|
      if current_dislike.posts.include?(@post)
        @dislike = current_dislike
      end
    end

    if @dislike.users.include?(@user)
      @dislike.users.delete(@user)
    end
    if !@like.users.include?(@user)
      @like.users << @user
    end
  redirect "posts/#{@post.id}/view"
>>>>>>> 3e9d2a919cd4695ecb967adbf2c2195ae4aad2cd
  end



  get '/posts/:id/new_dislike' do
    @post = Post.find_by_id(params[:id])
<<<<<<< HEAD
    if @post.user_id != @post.user.id 
    @post.dislikes += 1
    @post.save
  end

    erb :'/posts/view'
  end
=======
    @user = User.find_by_id(session[:id])
    Dislike.all.each do |current_dislike|
      if current_dislike.posts.include?(@post)
        @dislike = current_dislike
      end
    end
    Like.all.each do |current_like|
      if current_like.posts.include?(@post)
        @like = current_like
      end
    end
>>>>>>> 3e9d2a919cd4695ecb967adbf2c2195ae4aad2cd


    if @like.users.include?(@user)
      @like.users.delete(@user)
    end
    if !@dislike.users.include?(@user)
      @dislike.users << @user
    end
  redirect "posts/#{@post.id}/view"
  end










#
#
#   get '/posts/:id/edit' do
#     @post = Post.find_by(id: params[:id])
#     erb :'/posts/edit'
#   end
# #hi






  get '/posts/:id/location' do
    @user = User.find_by(id: session[:id])
    @inputed_location = params[:id]

    erb :'/posts/new'

  end
<<<<<<< HEAD


=======
>>>>>>> 3e9d2a919cd4695ecb967adbf2c2195ae4aad2cd
end


