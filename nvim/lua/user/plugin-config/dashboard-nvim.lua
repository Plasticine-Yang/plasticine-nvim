local status, db = pcall(require, 'dashboard')
if not status then
  vim.notify('没有找到 dashboard')
  return
end

db.custom_footer = {
  ' https://github.com/Plasticine-Yang',
  ' https://juejin.cn/user/1324240506200781',
}

db.custom_center = {
  {
    icon = '  ',
    desc = 'Projects',
    action = 'Telescope project',
  },
  {
    icon = '  ',
    desc = 'Recently files',
    action = 'Telescope oldfiles',
  },
}

-- db.custom_header = {
--   [[]],
--   [[          ▀████▀▄▄              ▄█ ]],
--   [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--   [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--   [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--   [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--   [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--   [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--   [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--   [[   █   █  █      ▄▄           ▄▀   ]],
-- }

db.custom_header = {
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[  ██████╗ ██╗      █████╗ ███████╗████████╗██╗ ██████╗██╗███╗   ██╗███████╗  ]],
  [[  ██╔══██╗██║     ██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██║████╗  ██║██╔════╝  ]],
  [[  ██████╔╝██║     ███████║███████╗   ██║   ██║██║     ██║██╔██╗ ██║█████╗    ]],
  [[  ██╔═══╝ ██║     ██╔══██║╚════██║   ██║   ██║██║     ██║██║╚██╗██║██╔══╝    ]],
  [[  ██║     ███████╗██║  ██║███████║   ██║   ██║╚██████╗██║██║ ╚████║███████╗  ]],
  [[ ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝╚═╝╚═╝  ╚═══╝╚══════╝  ]],
  [[]],
  [[]],
  [[]],
}
