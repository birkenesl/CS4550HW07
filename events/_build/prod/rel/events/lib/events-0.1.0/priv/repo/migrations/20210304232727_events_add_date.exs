defmodule Events.Repo.Migrations.EventsAddDate do
  use Ecto.Migration

  def change do

    alter table(:posts) do
      add :date, :text, null: false
    end

  end
end
