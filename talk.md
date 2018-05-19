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

Popular Hex Packages:

https://github.com/parroty/exvcr
HTTP request/response recording library for elixir, inspired by VCR.
362

https://github.com/pspdfkit-labs/bypass
Bypass provides a quick way to create a custom plug that can be put in place instead of an actual HTTP server to return prebaked responses to client requests.
392

https://github.com/jjh42/mock

A mocking library for the Elixir language.
We use the Erlang meck library to provide module mocking functionality for Elixir. It uses macros in Elixir to expose the functionality in a convenient manner for integrating in Elixir tests.
300

https://github.com/antonmi/espec
Elixir Behaviour Driven Development (RSpec for Elixir)
531

https://github.com/HashNuke/hound
For browser automation and writing integration tests in Elixir.
983

https://github.com/thoughtbot/ex_machina
Create test data
990

https://github.com/plataformatec/mox
Mox is a library for defining concurrent mocks in Elixir.
You can only create mocks based on behaviours
350

https://github.com/sonerdy/double
Brandon
30

https://github.com/daveshah/stubby
Dave Shah
1

--- show stars on github for each in the couple hunders,
--- then show mystery 12,933 stars without showing package
--- what if we could use somehing with all the starts?
--- slide over to elixir-lang/elixir
--- lets just use elixir and no external library
--- the key is DI -lets take a quick detour
