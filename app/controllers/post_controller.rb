class PostController < ApplicationController



  get '/posts/new' do
    @user = User.find_by(id: session[:id])



    erb :'/posts/new'
  end

  get '/posts/:id/new' do                    #create a new post
      @user = User.find_by(id: session[:id])
      redirect to '/posts/new'

    end

    post '/posts/:id/new' do   #this is to create a new post

      if params[:post][:name] == nil

      redirect '/posts/:id/new'
      else

      @post = Post.create(name: params[:post][:name], content: params[:post][:content])
      @user = User.find_by_id(session[:id])
      binding.pry
      @forum = Forum.find_or_create_by(city_name: @user.city)
      @forum.posts << @post
      @user.posts << @post
      @post.user =  @user
      @like = Like.new
      @dislike = Dislike.new
      @like.posts << @post
      @dislike.posts << @post
    end

      erb :"/users/home"

    end





  get '/posts/:id/view' do

    @post = Post.find_by(id: params[:id])
    binding.pry
    erb :'/posts/view'
  end



  get '/posts/:id/new_like' do
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(session[:id])
    Like.all.each do |current_like|
      if current_like.posts.include?(@post)
        @like = current_like
      end
    end

    if !@like.users.include?(@user)
      @like.users << @user
    end
  redirect "posts/#{@post.id}/view"
  end

  get '/posts/:id/new_dislike' do
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(session[:id])
    Dislike.all.each do |current_dislike|
      if current_dislike.posts.include?(@post)
        @dislike = current_dislike
      end
    end
    if !@dislike.users.include?(@user)
      @dislike.users << @user
    end
    redirect "posts/#{@post.id}/view"
  end











  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :'/posts/view'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :'/posts/edit'
  end
#hi
end
