class RepositoriesController < ApplicationController
  def index
    github = GithubService.new
    @repos_array = github.get_repos(session[:token])
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
  end

  def create
    github = GithubService.new
    github.create_repo(params[:name], session[:token])
    redirect_to '/'
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # redirect_to '/'
  end
end
