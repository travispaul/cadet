package.path = package.path .. ";?.lua"
local cadet = require("cadet")
local httpd = require("httpd")

App = {
  index = function(env, headers, query)
    local res = cadet.response

    view = {
      title = "Test Application!",
      question = "What do we want?",
      answer = "I don't know, but we want it now!",
    }

    body =
      cadet.render_file("example/templatefile/layout.html", view)

    if (body) then
      cadet.write(body)
    else
      cadet.write("um something went wrong\n")
    end

    return cadet.finish()
  end,
}

httpd.register_handler("index", App.index)
