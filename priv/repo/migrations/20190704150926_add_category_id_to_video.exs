defmodule Rumbl.Repo.Migrations.AddCategoryIdToVideo do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :category_id, references(:categories), on_delete: :nilify_all
    end
  end
end
