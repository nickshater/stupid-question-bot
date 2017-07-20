defmodule Dunce.Router do
  use Plug.Router

  plug Plug.Parsers, parsers: [:urlencoded]
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "")
  end

  post "/" do
    put_resp_content_type(conn, "application/json")
    %{"text" => text} = conn.params
    send_resp(conn, 200, Poison.encode!(%{"response_type" => "in_channel", "text": text}))
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
