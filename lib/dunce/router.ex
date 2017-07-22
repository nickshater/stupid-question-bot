defmodule Dunce.Router do
  use Plug.Router

  plug Plug.Parsers, parsers: [:urlencoded]
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "")
  end

  post "/" do
    %{"text" => text, "response_url" => url} = conn.params
     message = %{"response_type" => "in_channel", "text" => text}
    |> Poison.encode!([])
    send_resp(conn, 200, "")
    
    HTTPoison.post(url, message, %{"Content_Type" => "application/json"})

  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
