defmodule Events.Repo.Migrations.EventsAddName do
  use Ecto.Migration

  def change do

    alter table(:posts) do
      add :name, :text, null: false
    end

  end
end
