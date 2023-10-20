# BrunoBlog

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Data Models

There are two models **Post** and **Comment**.  Post's attributes are the
following:

- title
- body
- author
- inserted_at
- updated_at

Each Posts record can have multiple Comments.  Their attributes are:

- body
- author
- inserted_at
- updated_at

## Features

In the Posts listing page we can see all existing posts.  For each one we can
its title, the first few sentences of the post, its author, creation date, and
number of comments.  These are ordered by most recent creation date, from top to
bottom.

When viewing a post we can see its full contents as long as existing comments.
Here comments are ordered by creation date, from top to bottom.

