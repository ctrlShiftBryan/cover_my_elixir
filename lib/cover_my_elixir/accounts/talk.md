testing elixir api calls

One very common use case for Elixir and even phoenix is to build a gateway.

Basic Elixir Architecture

Controller -> Context -> Api or Database
UserController.index -> Accounts.list_users -> Repo.all(User)

* with_mock
* ex_vcr
* bypass
* dependency injection
* no deps
* mox double, stubby
