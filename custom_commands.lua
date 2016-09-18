local custom_commands = {}

names = {}
cmds = {}
tags_path = "/home/bill/.config/awesome/tags.txt"

function read()
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

read()

function custom_commands.getnames() return names end

function custom_commands.getcmds() return cmds end	

return custom_commands
