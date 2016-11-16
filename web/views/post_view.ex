defmodule Meower.PostView do
  @moduledoc false

  use Meower.Web, :view

  def render("index.json", %{posts: posts}) do
    render_many posts, __MODULE__, "show.json"
  end

  def render("show.json", %{post: post}) do
    %{
      id: post.id,
      author: post.author,
      content: post.content
    }
  end
end
