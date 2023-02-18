defmodule Editus.Documents.Document do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do
    field :content, :string
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
  end
end
