defmodule Events.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :name, :string
    field :date, :string
    field :body, :string
    belongs_to :user, Events.Users.User
    # field user_id which just contains an
    # id for a User
    has_many :comments, Events.Comments.Comment
    has_many :responses, Events.Responses.Response

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :name, :date, :user_id])
    |> validate_required([:body, :name, :date, :user_id])
  end
end
