-- pastebin run -f YVqKFnsP
-- nexDHD von Nex4rius
-- https://github.com/Nex4rius/Nex4rius-Programme/tree/master/nexDHD

os.sleep(1)

local shell = shell or require("shell")
_G.shell = shell
local alterPfad
local args = ...

if require then
    alterPfad = shell.getWorkingDirectory()
    shell.setWorkingDirectory("/")
else
    local monitor = peripheral.find("monitor")
    if not monitor then
        print("keinen >Advanced Monitor< gefunden")
    end
    term.redirect(monitor)
    term.clear()
    monitor.setTextScale(0.5)
    monitor.setCursorPos(1, 1)
end

if type(args) ~= "string" then
    args = nil
end

local ergebnis, grund = pcall(loadfile("/stargate/check.lua"), args)
if not ergebnis then
    print("<Fehler> check.lua")
    print(grund)
    os.sleep(2)
    if require then
        if loadfile("/bin/wget.lua")("-f", "https://raw.githubusercontent.com/Nex4rius/Nex4rius-Programme/master/nexDHD/installieren.lua", "/installieren.lua") then
            loadfile("/installieren.lua")()
        end
    else
        shell.run("pastebin run -f YVqKFnsP")
    end
end

if require then
    require("shell").setWorkingDirectory(alterPfad)
end
