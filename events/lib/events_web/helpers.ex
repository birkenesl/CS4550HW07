defmodule EventsWeb.Helpers do
  alias Events.Users.User
  alias Events.Posts.Post
  #most of this code attributed to Nat Tuck lecture 13 code

  def current_user_id(conn) do
    user = conn.assigns[:current_user]
    user && user.id
  end

  def have_current_user?(conn) do
    conn.assigns[:current_user] != nil
  end

  def find_response(conn, %Post{} = post) do
    user = conn.assigns[:current_user]
    responses = post.responses
    resp = Enum.find(responses, fn x -> x.user.id == user.id end)
    if resp do
      resp.id
    else
      false
    end




  end

  def current_user_is_owner?(conn, %User{} = user) do
    current_user_is_owner?(conn, user.id)
  end

  def current_user_is_owner?(conn, user_id) do
    user = conn.assigns[:current_user]
    user && user.id == user_id
  end




end
