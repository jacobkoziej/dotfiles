local xrandr = { }

function xrandr.outputs()
	local outputs = { }

	local xrandr = io.popen('xrandr --current --query')
	if xrandr then
		for line in xrandr:lines() do
			local output = line:match('^([%w-]+) connected')
			if output then outputs[#outputs + 1] = output end
		end

		xrandr:close()
	end

	return outputs
end

return xrandr
