local utils = require("utils")
local url = utils.formatURL
local command = utils.formatCommand
local text = utils.text

local function rurl(...)
  return { url(unpack(arg)) }
end

local function processNames(names, prefixes, suffixed)
  local gennedNames = {}
  if type(names) == "string" then names = { names } end
  if type(prefixes) == "string" then prefixes = { prefixes } end

  for _, prefix in pairs(prefixes) do
    for _, name in pairs(names) do
      table.insert(gennedNames, prefix .. ":" .. name)
      if suffixed then
        table.insert(gennedNames, name .. ":" .. prefix)
      end
    end
  end

  return gennedNames
end

local function github(url, names)
  return {
    names = processNames(names, { "github", "gh" }, true),
    response = rurl("https://github.com/" .. url, url .. " - GitHub")
  }
end

local function docBase(url, siteName, defaultPrefix, page, pageName, names, prefixes)
  return {
    names = processNames(names, prefixes or defaultPrefix),
    response = rurl(url .. page, pageName .. " - " .. siteName)
  }
end

local function wiki(page, pageName, names, prefixes)
  return docBase("https://wiki.computercraft.cc/", "CC:Tweaked Wiki", { "wiki", "w" }, page, pageName, names, prefixes)
end

local function plethora(page, pageName, names)
  return docBase("https://squiddev-cc.github.io/plethora/", "Plethora", { "plethora", "p" }, page .. ".html", pageName, names)
end

return {
  -- Chatboxes
  {
    names = { "chatbox:docs", "chatbox", "chatbot", "cb" },
    response = rurl("https://chat.switchcraft.pw/docs", "Chatbox documentation")
  },

  -- GitHubs
  github("SquidDev-CC/CC-Tweaked", { "cctweaked", "cct" }),
  github("SquidDev-CC/Plethora", { "plethora", "p" }),
  github("Vexatos/Computronics", "computronics"),
  github("kepler155c/opus", "opus"),
  github("kepler155c/opus-apps", { "opus-apps", "milo" }),

  -- Forums
  {
    names = { "forums", "forum" },
    response = rurl("https://forums.computercraft.cc/", "ComputerCraft:Tweaked Forums")
  },

  -- Wiki
  {
    names = { "wiki" },
    response = rurl("https://wiki.computercraft.cc/", "ComputerCraft:Tweaked Wiki")
  },
  {
    names = { "wiki:old" },
    response = rurl("http://www.computercraft.info/wiki", "Old (outdated) ComputerCraft Wiki")
  },
  {
    names = { "websockets", "ws" },
    response = rurl("https://github.com/SquidDev-CC/CC-Tweaked/wiki/http-library#httpwebsocketurl-string-headers-table-tablefalse-string", "http.websocket - CC:Tweaked GitHub")
  },
  wiki("Special:RequestAccount", "Request account", "account"),
  wiki("Network_security", "Network security", { "network", "networksecurity", "netsec" }),

  -- Wiki: HTTP API
  {
    names = { "http" },
    response = rurl("https://wiki.computercraft.cc/HTTP_API", "HTTP API - CC:Tweaked Wiki")
  },
  wiki("Http.get", "http.get", "get", "http"),
  wiki("Http.post", "http.post", "post", "http"),

  -- Discords
  {
    names = { "discord:switchcraft", "discord:sc", "discord" },
    response = rurl("https://discord.switchcraft.pw")
  },
  {
    names = { "discord:cc", "discord:cct", "discord:hydro", "ccdiscord", "cctdiscord" },
    response = rurl("https://discord.computercraft.cc")
  },

  -- Plethora
  plethora("getting-started", "Getting started", { "docs", "d" }),
  plethora("methods", "Method reference", { "methods", "method", "reference", "m" }),
  plethora("item-transfer", "Moving items", { "items", "item", "transfer", "i" }),
  plethora("items/module-introspection", "Introspection module", "introspection"),
  plethora("items/module-laser", "Frickin' laser beam", { "laser", "l" }),
  plethora("items/module-scanner", "Block scanner", { "blockscanner", "scanner", "scan" }),
  plethora("items/module-sensor", "Entity sensor", { "entitysensor", "entities", "entity", "sensor", "sense" }),
  plethora("items/module-kinetic", "Kinetic augment", { "kineticaugment", "kinetic", "k" }),
  plethora("items/module-chat", "Chat recorder", { "chatrecorder", "chat" }),
  plethora("items/module-overlay", "Overlay glasses", { "overlayglasses", "overlay", "glasses" }),
  plethora("items/redstone-integrator", "Redstone integrator", { "redstoneintegrator", "redstone", "integrator", "red" }),
  plethora("items/keyboard", "Keyboard", { "keyboard", "key" }),
  plethora("examples/laser-drill", "Laser drill", "drill"),
  plethora("examples/laser-sentry", "Laser sentry", "sentry"),
  plethora("examples/auto-feeder", "Auto feeder", "feeder"),

  -- Programs
  {
    names = { "ore3d", "xray" },
    response = rurl("https://forums.computercraft.cc/index.php?topic=5", "Ore3D - true 3D Augmented Reality XRAY Vision")
  },
  {
    names = { "milo" },
    response = rurl("https://forums.computercraft.cc/index.php?topic=87", "Milo - Crafting and Inventory System")
  },
  {
    names = { "opus" },
    response = rurl("http://www.computercraft.info/forums2/index.php?/topic/27810-opus-os/", "Opus OS")
  },

  -- Shops
  {
    names = { "shop:kmarx", "kmarx" },
    response = rurl("https://energetic.pw/computercraft/kmarx/", "kMarx by HydroNitrogen")
  },
  {
    names = { "shop:xenon", "xenon" },
    response = rurl("https://github.com/incinirate/Xenon/wiki", "Xenon by Emma")
  },
  {
    names = { "shop:swshop", "swshop" },
    response = rurl("https://forums.computercraft.cc/index.php?topic=87", "Milo - Crafting and Inventory System")
  },
  {
    names = { "shopcomparison", "shops" },
    response = rurl("https://energetic.pw/switchcraft/shop-comparison", "Shop Program Comparison Table")
  },

  -- Misc
  {
    names = { "cloudcatcher", "cloud" },
    response = rurl("https://cloud-catcher.squiddev.cc/", "Cloud Catcher")
  },
  {
    names = { "rom" },
    response = rurl("https://rom.switchcraft.pw/", "SwitchCraft ROM")
  },
  {
    names = { "rules" },
    response = rurl("https://rules.switchcraft.pw/", "SwitchCraft Rules")
  },
  {
    names = { "dynmap", "map", "d" },
    response = rurl("https://dynmap.switchcraft.pw/", "SwitchCraft Dynmap")
  },
  {
    names = { "switchmarket", "market", "auctions", "auction" },
    response = rurl("https://market.switchcraft.pw/", "SwitchMarket")
  }
}