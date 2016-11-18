defmodule Meower.PostFeedChannel do
  @moduledoc """
  Channel used for broadcasting info about changes in posts
  """

  use Meower.Web, :channel

  alias Meower.Post
  alias Meower.PostView
  alias Meower.Endpoint

  ## API

  def broadcast_new_post(%Post{} = post) do
    payload = PostView.render "show.json", post: post
    Endpoint.broadcast "post_feed", "new_post", %{"post" => payload}
  end

  ## Phoenix.Channel callbacks

  def join("post_feed", _params, socket) do
    {:ok, socket}
  end
end
