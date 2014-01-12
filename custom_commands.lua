local custom_commands = {}

names = {}
cmds = {}

function cmds.read()
	local x = 1

	for line in io.lines("/home/bill/.config/awesome/tags.txt") do
		for k,v in string.gmatch(line, "(%w+)|(%w+)") do 
			names[x] = k
			cmds[x] = v
			x = x+1
		end
	end
end

function cmds.getnames() return names end

function cmds.getcmds() return cmds end	
