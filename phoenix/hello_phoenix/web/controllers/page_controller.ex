defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  def show(conn, _params) do
    page = %{title: "foo"}
    render conn, "show.json", page: page
  end

  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]
    render conn, "index.json", pages: pages
  end

  def test(conn, _params) do
    render conn, "test.html"
  end

  # def index(conn, _params) do
  #   # conn
  #   # |> put_flash(:info, "Welcome to Phoenix, from flash info!")
  #   # |> put_flash(:error, "Let's pretend we have an error.")
  #   # |> render("index.html")
  #   conn
  #   |> assign(:message, "BANANA")
  #   |> render("index.html")
  # end

  # plug :assign_welcome_message, "Welcome Back"
  #
  # def index(conn, _params) do
  #   render conn, :index
  # end
  #
  # # def index(conn, _params) do
  # #   redirect conn, to: "/redirect_test"
  # # end
  #
  # def redirect_test(conn, _params) do
  #   text conn, "Redirect!"
  # end
  # def index(conn, _params) do
  #   conn
  #   |> assign(:name, "Dweezil")
  #   |> render("index.html")
  # end

  # def index(conn, params) do
  #   conn
  #   |> put_layout(false)
  #   |> render "index.html"
  # end


  # def index(conn, _params) do
  #   conn
  #   |> send_resp(201, "")
  # end
  #
  # def index(conn, _params) do
  #   conn
  #   |> put_resp_content_type("text/plain")
  #   |> send_resp(201, "")
  # end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
