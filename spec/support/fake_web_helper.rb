module FakeWebHelper
  def fake(uri, file, verb = :get)
    FakeWeb.register_uri(verb, uri, response: response(file))
  end

  def header(html)
    "HTTP/1.1 200 OK\n\n#{html}"
  end

  def response(file)
    html = File.read("spec/fixtures/#{file}")
    header(html)
  end
end
