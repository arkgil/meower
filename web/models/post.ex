defmodule Meower.Post do
  @moduledoc """
  Schema defining posts created by cats
  """

  use Meower.Web, :model

  @type t :: %__MODULE__{author: String.t,
                         content: String.t}

  schema "posts" do
    field :author, :string
    field :content, :string

    timestamps
  end

  @spec changeset(t, map) :: Ecto.Changeset.t
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :content])
    |> validate_required([:author, :content])
    |> validate_length(:author, min: 3, max: 20)
    |> validate_length(:content, min: 1, max: 140)
  end
end
