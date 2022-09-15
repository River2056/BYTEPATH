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
