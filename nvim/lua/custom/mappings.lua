-- All keyboard mappings will go here.

local M = {}

-- Base Nvim mappings
M.general = {
    n = {
        ["<leader>wso"] = {":w <CR> :so <CR>", "Write and Shout Out"}
    }
}

-- Debugger mappings
M.dap = {
  plugin = true,  -- Mapping only exists if `dap` plugin exists.
  n = {  -- Normal mode mappings.
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint"}  -- Toggle breakboint
  }
}

-- Python debugger mappings.
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {  -- Run Python Debugger
      function ()
        require("dap-python").test_method()
      end,
      "Open DAP UI can test method."
    }
  }
}

M.dapui = {
    plugin = true,
    n = {
        ["<leader>dpc"] = { function () require("dapui").close() end, "Close DAP UI"}
    }
}

-- Harpoon
M.harpoon = {
 plugin = true,
 n = {
    ["<leader>a"] = {function() require("harpoon.mark").add_file() end, "Mark file"},
    ["<leader>rm"] = {function() require("harpoon.mark").rm_file() end, "Remove marked file"},
    ["<C-e>"] = {function() require("harpoon.ui").toggle_quick_menu() end, "Toggle Harpoon UI"},
    ["<leader>1"] = {function() require("harpoon.ui").nav_file(1) end, "Go to marked file 1"},
    ["<leader>2"] = {function() require("harpoon.ui").nav_file(2) end, "Go to marked file 2"},
    ["<leader>3"] = {function() require("harpoon.ui").nav_file(3) end, "Go to marked file 3"},
    ["<leader>4"] = {function() require("harpoon.ui").nav_file(4) end, "Go to marked file 4"},
    ["<leader>5"] = {function() require("harpoon.ui").nav_file(5) end, "Go to marked file 5"},
    ["<leader>6"] = {function() require("harpoon.ui").nav_file(6) end, "Go to marked file 6"},
    ["<leader>7"] = {function() require("harpoon.ui").nav_file(7) end, "Go to marked file 7"},
    ["<leader>8"] = {function() require("harpoon.ui").nav_file(8) end, "Go to marked file 8"},
    ["<leader>9"] = {function() require("harpoon.ui").nav_file(9) end, "Go to marked file 9"},
 }
}


-- Refactoring
M.refactoring = {
    plugin = true,
    v = {
        ["<leader>re"] = {function() require("refactoring").refactor("Extract Function") end, "Extract method from selected"},
        ["<leader>rf"] = {function() require("refactoring").refactor("Extract Function To File") end, "Extract method to file"},
        ["<leader>rv"] = {function() require("refactoring").refactor("Extract Variable") end, "Simplify with variables"},
        ["<leader>rr"] = {function() require("refactoring").select_refactor() end, "Refactoring menu"},
    },
}


-- New and improved terminal
M.terminal = {
    plugin = true,
    n = {
        ["t"] = {function() require("betterTerm").open() end, "Open terminal"},
        ["<leader>tt"] = {function() require("betterTerm").select() end, "Select terminal"},
    }
}

M.code_runner = {
    plugin = true,
    n = {
        -- ["<leader>r"] = {"<cmd> RunCode<CR>", "Start code runner"},
        ["<leader>rf"] = {"<cmd> RunFile<CR>", "Run current file"},
        -- ["<leader>rft"] = {"<cmd> RunFile tab<CR>", "Run current file in new tab"},
        ["<leader>rp"] = {"<cmd> RunProject<CR>", "Run current project, if exists"},
        ["<leader>rc"] = {"<cmd> RunClose<CR>", "Close code runner"}
    }
}
M.git = {
    plugin = true,
    n = {
        ["<leader>gd"] = {"<cmd> Gdiffsplit<CR>", "Git diff for current file"}
    }
}


return M
