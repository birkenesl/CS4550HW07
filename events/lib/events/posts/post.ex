defmodule Events.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :name, :string
    field :date, :string
    field :body, :string
    #TODO date with datepicker js widget

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :name, :date])
    |> validate_required([:body, :name, :date])
  end
end
