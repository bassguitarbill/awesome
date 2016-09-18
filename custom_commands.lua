local awful = require("awful")
local naughty = require("naughty")
local custom_commands = function(tags_path)

    names = {}
    cmds = {}
    local cc = {}

    function read(tags_path)
        local x = 1

        for line in io.lines(tags_path) do
            if string.match(line, "#.*")
                then print("comment")   
                else 
                    for k,v in string.gmatch(line, "(.+)|(.+)") do 
                        names[x] = k
                        cmds[x] = v
                        x = x+1
                    end
                end
            end
        end

    read(tags_path)

    function cc.getnames() return names end

    function cc.getcmds() return cmds end

    function cc.addtag()
        -- local path!!
      awful.prompt.run({ prompt = "Add command: "},
                  mypromptbox[mouse.screen].widget,
                  function(c) awful.util.spawn(genAddCommand(tags_path,c)) end,
                  nil)
    end

    function cc.remtag()
        -- local path!!
      awful.prompt.run({ prompt = "Remove command: "},
                  mypromptbox[mouse.screen].widget,
                  function(c) awful.util.spawn(genRemCommand(tags_path,c)) end,
                  nil)
    end

    function genAddCommand(tp, c)
        naughty.notify({title = tagname, text = "/home/bill/dev/awesome/addtag.sh " .. tp .. " " .. c, timeout = 0})
        return "/home/bill/dev/awesome/addtag.sh " .. tp .. " " .. c
    end

    function genRemCommand(tp, c)
        naughty.notify({title = tagname, text = "/home/bill/dev/awesome/removetag.sh " .. tp .. " " .. c, timeout = 0})
        return "/home/bill/dev/awesome/removetag.sh " .. tp .. " " .. c
    end
    
    return cc

end

return custom_commands
