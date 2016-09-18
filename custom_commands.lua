local custom_commands = function(tags_path)

    names = {}
    cmds = {}
    local cc = {}

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

        function cc.getnames() return names end

        function cc.getcmds() return cmds end

        return cc

    end

    return custom_commands
