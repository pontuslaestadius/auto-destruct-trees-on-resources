local function on_chunk_generated(event)
    local surface = event.surface
    local area = event.area

    local arrayOfLuaEntityResource = surface.find_entities_filtered {
        area = area,
        type = "resource"
    }

    if #arrayOfLuaEntityResource > 0 then
        local arrayOfLuaEntityTree = surface.find_entities_filtered {
            area = area,
            type = "tree"
        }

        if #arrayOfLuaEntityTree > 0 then
            for k, v in pairs(arrayOfLuaEntityTree) do
                local treeP = v.position

                for k2, v2 in pairs(arrayOfLuaEntityResource) do
                    local resourceP = v2.position

                    if math.floor(treeP.x) == math.floor(resourceP.x) and
                        math.floor(treeP.y) == math.floor(resourceP.y) then
                        v.order_deconstruction("player")
                    end
                end
            end
        end
    end
end

script.on_event({defines.events.on_chunk_generated}, on_chunk_generated)
