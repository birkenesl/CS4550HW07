# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Events.Repo.insert!(%Events.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Events.Repo
alias Events.Users.User
alias Events.Posts.Post
alias Events.Photos

# a lot of this code attributed to Nat Tuck Lecture 12/13 code
defmodule Inject do
  def photo(name) do
    photos = Application.app_dir(:events, "priv/photos")
    path = Path.join(photos, name)
    {:ok, hash} = Photos.save_photo(name, path)
    hash
  end
end

stock = Inject.photo("stock.jpeg")

john = Repo.insert!(%User{name: "john", photo_hash: stock, email: "john@test.com"})
bob = Repo.insert!(%User{name: "bob", photo_hash: stock, email: "bob@test.com"})

Repo.insert!(%Post{
  name: "John Testing",
  date: "2021-03-15 12:00",
  body: "John says Hi",
  user_id: john.id})
Repo.insert!(%Post{
  name: "Bob Testing",
  date: "2021-03-15 3:00",
  body: "Bob says Yo",
  user_id: bob.id})
