defmodule Editus.Repo do
  use Ecto.Repo,
    otp_app: :editus,
    adapter: Ecto.Adapters.Postgres
end
