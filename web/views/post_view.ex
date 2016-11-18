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
      content: post.content,
      created_at: post.inserted_at |> datetime_to_string()
    }
  end

  def datetime_to_string(%Ecto.DateTime{} = dt) do
    date = [dt.year, dt.month, dt.day] |> Enum.join("-")
    time = "#{dt.hour}:#{dt.min}"
    "#{time} #{date}"
  end
end
