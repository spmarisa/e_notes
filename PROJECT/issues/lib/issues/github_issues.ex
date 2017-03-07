defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir dave@pragprog.com"} ]
  require Logger

  def fetch(user, project) do
    Logger.info "Fetching user #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end


  def handle_response({ :ok, %{status_code: 200, body: body}}) do
    # { :ok, body }
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    { :ok, Poison.Parser.parse!(body) }
  end

  def handle_response({ _, %{status_code: _, body: body}}) do
    # { :error, body }
    # Logger.error "Error #{status} returned"
    { :error, Poison.Parser.parse!(body) }
  end

  @github_url Application.get_env(:issues, :github_url)
  def issues_url(user, project) do
    # "https://api.github.com/repos/#{user}/#{project}/issues"
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

end
