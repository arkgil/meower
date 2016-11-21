defmodule Meower.CatBot do
  @moduledoc """
  Meower's chat bot
  """

  use GenServer

  alias Meower.Post
  alias Meower.PostService

  @me "CatBot"
  @bot_msg_r ~r{/catbot}
  @compliment_r ~r{/catbot\s+compliment}
  @compliments ["is beatiful", "is awesome", "is so smart", "is briliant"]

  ## API

  @spec start_link :: GenServer.on_start
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @spec notify(Post.t) :: :ok
  def notify(%Post{} = post) do
    if Regex.match? @bot_msg_r, post.content do
      GenServer.cast(__MODULE__, {:new_post, post})
    else
      :ok
    end
  end

  ## GenServer callbacks

  def handle_cast({:new_post, post}, state) do
    handle_new_post(post)
    {:noreply, state}
  end

  ## Internals

  @spec handle_new_post(Post.t) :: any
  defp handle_new_post(post) do
    cond do
      Regex.match?(@compliment_r, post.content) ->
        post_compliment(post.author)
      true ->
        post_introduction()
    end
  end

  @spec post_compliment(String.t) :: any
  defp post_compliment(for) do
    compliment = Enum.random @compliments
    content = "@#{for} #{compliment}"
    post content
  end

  @spec post_introduction :: any
  defp post_introduction do
    content = """
    Hi, I am an assistant of this app, nice to meet you!
    """
    post content
  end

  defp post(content) do
    PostService.insert(%{author: @me, content: content})
  end
end
