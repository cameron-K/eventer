class ConnectionHelper
  attr_accessor :connection

  def execute(route, method, access_token, do_input, do_output)
    url = Java::Net::URL.new("http://10.0.3.2:3000/api/#{route}")
    connection = url.openConnection()
    connection.setRequestProperty("Authorization", "#{access_token}")
    connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8")
    connection.setReadTimeout(10000);
    connection.setConnectTimeout(15000);
    connection.setRequestMethod("#{method}");
    connection.setDoInput(do_input)
    connection.setDoOutput(do_output)
    input_reader = Java::Io::InputStreamReader.new(connection.getInputStream)
    reader = Java::Io::BufferedReader.new(input_reader)
    content = ""
    line = ""
    while (line = reader.readLine) != nil
      content += line
    end
    reader.close()
    content
  end
end