defmodule Meower.PageController do
  use Meower.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
