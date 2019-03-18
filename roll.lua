function roll_single(str)
	if tonumber(str) then
		return tonumber(str)
	end
	local count, sides, rest = string.match(str, '(%-?[0-9]*)d([0-9]*)(.*)')
	if count == nil then return nil end
	if count == '' then
		count = 1
	else
		count = tonumber(count)
	end
	local fromzero = string.gsub(sides, 1, 1) == '0'
	sides = tonumber(sides)
	local lo = 1
	local hi = count
	for mod, cnt in string.gmatch(rest, '([^0-9])([0-9]*)') do
		cnt = tonumber(cnt) or 1
		if mod == 'l' then hi = cnt end
		if mod == 'h' then lo = count + 1 - cnt end
		if mod == 'L' then lo = cnt + 1 end
		if mod == 'H' then hi = count - cnt end
	end

	local rolls = {}
	for i = 1, count do
		rolls[#rolls+1] = math.random(1, sides) - (fromzero and 1 or 0)
	end
	table.sort(rolls)

	local ret = 0
	for i = lo, hi do
		ret = ret + rolls[i]
	end
	return ret
end

function roll(str)
	local ret = 0
	for dice in string.gmatch(str, '%-?[^+-]+') do
		ret = ret + roll_single(dice)
	end
	return string.format('%s = %d', str, ret)
end


math.randomseed(os.time())
for k, v in ipairs({ ... }) do
	print( roll(v) )
end
