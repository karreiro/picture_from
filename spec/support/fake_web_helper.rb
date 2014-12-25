module FakeWebHelper
  def fake(uri, options = {})
    verb = options[:verb] || :get
    FakeWeb.register_uri(verb, uri, response: response(options))
  end

  def response(options)
    header(options) + body(options)
  end

  def header(options)
    status = options[:status] || 200
    message = options[:message] || 'OK'
    "HTTP/1.1 #{status} #{message}\n\n"
  end

  def body(options)
    options[:file] ? File.read("spec/fixtures/#{options[:file]}") : ''
  end
end
