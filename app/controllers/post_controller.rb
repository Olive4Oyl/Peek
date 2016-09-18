class PostController < ApplicationController



  get '/posts/new' do
    erb :'/posts/new'
  end

  post '/posts/:id/new' do
    if params[:post][:content] == nil || params[:post][:content] == ""
      #insert flash message
      redirect to '/posts/new'
    else
      @post = Post.create(content: params[:post][:content], name: params[:post][:name])
      @user = User.find_by_id(session[:id])
      @forum = Forum.find_or_create_by(params[:id])
      @forum.posts << @post
      @post.likes = 0
      @post.dislikes = 0
      @user.posts << @post
      @post.user =  @user
    end
    erb :'/users/home'
  end


  # get '/posts/view' do

  # end


  get '/posts/:id/view' do
    @post = Post.find(params[:id])
    erb :'/posts/view'
  end

  get '/posts/:id/new_like' do
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(session[:id])

    
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
  end

  get '/posts/:id/new_dislike' do
    @post = Post.find_by_id(params[:id])
    if @post.user_id != @post.user.id 
    @post.dislikes += 1
    @post.save
  end

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


end


