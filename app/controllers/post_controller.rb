class PostController < ApplicationController
  get '/posts/new' do
    erb :'/posts/new'
  end

  post '/posts/new' do
    if params[:post][:content] == nil || params[:post][:content] == ""
      #insert flash message
      redirect to '/posts/new'
    else
      @post = Post.create(content: params[:post][:content], name: params[:post][:name])
      @user = User.find_by_id(session[:id])
      @post.location = @user.zip_location
      @post.likes = 0
      @post.dislikes = 0
      @user.posts << @post
      @post.user =  @user
    end
    erb :'/users/home'
  end

<<<<<<< HEAD
  get '/posts/view' do
=======
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
>>>>>>> 20fb723a758e011b5fb966f5a2eab0492f545501
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
<<<<<<< HEAD

end

=======
#hi
end
>>>>>>> 20fb723a758e011b5fb966f5a2eab0492f545501
