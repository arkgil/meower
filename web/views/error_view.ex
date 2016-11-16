defmodule Meower.ErrorView do
  use Meower.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("404.json", _assigns) do
    error("not found")
  end

  def render("500.json", _assigns) do
    error("internal server error")
  end

  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end

  defp error(msg) do
    %{"error" => msg}
  end
end
