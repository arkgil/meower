defmodule Meower.PostController do
  @moduledoc false

  use Meower.Web, :controller

  alias Meower.PostService
  alias Meower.ErrorView

  def index(conn, _params) do
    posts = PostService.all
    render conn, "index.json", posts: posts
  end

  def show(conn, %{"id" => id}) do
    case PostService.get id do
      {:ok, post} ->
        render conn, "show.json", post: post
      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> render(ErrorView, "404.json")
    end
  end

  def create(conn, %{"post" => post_params}) do
    case PostService.insert(post_params) do
      {:ok, post} ->
        conn
        |> put_resp_header("location", post_url(conn, :show, post))
        |> put_status(:created)
        |> render("show.json", post: post)
      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> text("")
    end
  end
end
