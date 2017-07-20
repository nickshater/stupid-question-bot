defmodule Dunce.Router do
  use Plug.Router

  plug Plug.Parsers, parsers: [:urlencoded]
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "")
  end

  post "/" do
    conn = put_resp_content_type(conn, "application/json")
    %{"text" => text} = conn.params
     message = %{"response_type" => "in_channel", "text" => text}
    |> Poison.encode!([])
    send_resp(conn, 200, message)
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
