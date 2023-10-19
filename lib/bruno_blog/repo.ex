defmodule BrunoBlog.Repo do
  use Ecto.Repo,
    otp_app: :bruno_blog,
    adapter: Ecto.Adapters.Postgres
end
