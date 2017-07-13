defmodule Dunce.Router do
  use Trot.Router

  get "/" do
    conn = put_resp_content_type(conn, "application/json")

    message = %{
      "response_type" => "in_channel",
      "text" => "DIPSHIT ALERT",
      "attachments" => [ %{"text" => "sample text"}]
    } 
    |> Poison.encode!([])

    send_resp(conn, 200, message)
  end
  import_routes Trot.NotFound
end
