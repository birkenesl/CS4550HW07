defmodule Events.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :photo_hash, :string
    has_many :posts, Events.Posts.Post
    has_many :comments, Events.Comments.Comment
    has_many :responses, Events.Responses.Response

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :photo_hash, :email])
    |> validate_required([:name, :photo_hash, :email])
    |> unique_constraint(:email)
  end
end
