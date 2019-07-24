defmodule Rumbl.Repo.Migrations.AddSlugToVideos do
  @moduledoc false

  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :slug, :string
    end
  end
end
