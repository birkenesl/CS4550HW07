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

john = Repo.insert!(%User{name: "john", email: "john@test.com"})
bob = Repo.insert!(%User{name: "bob", email: "bob@test.com"})

Repo.insert!(%Post{name: "John Testing", date: "12/2/2", body: "John says Hi",
 user_id: john.id})
Repo.insert!(%Post{name: "Bob Testing", date: "12/2/2", body: "Bob says Yo",
user_id: bob.id})
