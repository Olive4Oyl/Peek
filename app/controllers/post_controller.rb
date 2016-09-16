class PostController < ApplicationController

  get '/posts/new' do
    @user = User.find_by(id: session[:id])

    erb :'/posts/new'
  end

  get '/posts/:id/home/new' do
      @user = User.find_by(id: session[:id])
      redirect to '/posts/new'
    end

    post '/posts/:zipcode/new' do

      if params[:post][:content] == nil || params[:post][:content] == nil
      flash[:message] = "Hey you need to enter a name and content!"
      else

      @post = Post.create(content: params[:post][:content], name: params[:post][:name])
      @user = User.find_by_id(session[:id])
      @forum = Forum.find_or_create_by(params[:id])
      @forum.posts << @post
      @user.posts << @post
      @post.user =  @user
    end

      erb :"/users/home"

  end




  get '/posts/:id/forum/new' do
    if params[:post][:content] == nil || params[:post][:content] == ""
      #insert flash message
      redirect to '/posts/new'
    else
      @post = Post.create(content: params[:post][:content], name: params[:post][:name])
      @user = User.find_by_id(session[:id])
      @forum = Forum.find_by_id(params[:id])
      @forum.posts << @post
      @user.posts << @post
      @post.user =  @user
    end

      erb :"/locations/forums"

  end





  get '/posts/:id/view' do
    @post = Post.find(params[:id])
    erb :'/posts/view'
  end

  get '/posts/:id/new_like' do
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(session[:id])
    binding.pry
    if @post.likes_array.include?(@user)
      #flash error message
      #blablablabalabalba
    else
      @post.likes += 1
      @post.likes_array << @user
      @post.save
    end
    erb :'/posts/view'
  end

  get '/posts/:id/new_dislike' do
    @post = Post.find_by_id(params[:id])
    @post.dislikes += 1
    @post.save
    erb :'/posts/view'
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
