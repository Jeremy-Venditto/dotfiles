function lastclient()
    local s = awful.screen.focused()
    local c = awful.client.focus.history.get(s, 0)
    if c then
        client.focus = c
        c:raise()
    end
end

client.connect_signal("property::minimized", lastclient)

client.connect_signal("unmanage", lastclient)
