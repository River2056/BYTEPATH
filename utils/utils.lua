function recursiveEnumerate(folder, fileList)
	local items = love.filesystem.getDirectoryItems(folder)
	for _, item in ipairs(items) do
		local file = folder .. "/" .. item
		if love.filesystem.getInfo(file, "file") then
			table.insert(fileList, file)
		elseif love.filesystem.getInfo(file, "directory") then
			recursiveEnumerate(file, fileList)
		end
	end
end

function mkdirs(path)
	local path_exists, _ = isdir(path)
	if not path_exists then
		os.execute("mkdir " .. path)
	end
end

function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			return true
		end
	end
	return ok, err
end

function isdir(path)
	return exists(path .. "/")
end

function addsubmodule(url, dest)
	local path_exists = isdir(dest)
	if not path_exists then
		os.execute("git submodule add " .. url .. " " .. dest)
	end
end
