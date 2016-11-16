defmodule Meower.PostService do
  @moduledoc """
  Functons for managing `Meower.Post` persistence
  """

  alias Meower.{Repo, Post}
  alias Ecto.Changeset

  @spec get(id :: pos_integer | String.t) :: {:ok, Post.t} | {:error, :not_found}
  def get(id) when is_integer(id) do
    case Repo.get Post, id do
      nil -> {:error, :not_found}
      post -> {:ok, post}
    end
  end
  def get(id) when is_binary(id) do
    case parse_id(id) do
      {:ok, id} -> get(id)
      :error -> {:error, :not_found}
    end
  end

  @spec all :: [Post.t]
  def all do
    Repo.all Post
  end

  @spec insert(map) :: {:ok, Post.t} | {:error, Changeset.t}
  def insert(params) do
    %Post{}
    |> Post.changeset(params)
    |> Repo.insert()
  end

  defp parse_id(id) when is_binary(id) do
    case Integer.parse(id) do
      {num, _rest} -> {:ok, num}
      :error -> :error
    end
  end
end
