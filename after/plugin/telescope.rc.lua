local status, telescope = pcall(require, "telescope")
if (not status) then
    return
end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require"telescope".extensions.file_browser.actions

local fb_utils = require "telescope._extensions.file_browser.utils"
local action_state = require "telescope.actions.state"
local action_utils = require "telescope.actions.utils"
local Path = require "plenary.path"

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd('normal vbd')
                    end
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ['r'] = function(prompt_bufnr)
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        local quiet = current_picker.finder.quiet
                        local selections = fb_utils.get_selected_files(prompt_bufnr, false)

                        local parent_dir = Path:new(current_picker.finder.path):parent()
                        if not vim.tbl_isempty(selections) then
                            fb_actions.batch_rename(prompt_bufnr, selections)
                        else
                            local entry = action_state.get_selected_entry()
                            if not entry then
                                fb_utils.notify("action.rename", {
                                    msg = "No selection to be renamed!",
                                    level = "WARN"
                                })
                                return
                            end
                            local old_path = Path:new(entry[1])
                            -- "../" aka parent_dir more common so test first
                            if old_path.filename == parent_dir.filename then
                                fb_utils.notify("action.rename", {
                                    msg = "Please select a valid file or folder!",
                                    level = "WARN",
                                    quiet = quiet
                                })
                                return
                            end
                            vim.ui.input({
                                prompt = "Insert a new name: ",
                                default = old_path:absolute(),
                                completion = "file"
                            }, function(file)
                                vim.cmd [[ redraw ]] -- redraw to clear out vim.ui.prompt to avoid hit-enter prompt
                                if file == "" or file == nil then
                                    fb_utils.notify("action.rename", {
                                        msg = "Renaming aborted!",
                                        level = "WARN",
                                        quiet = quiet
                                    })
                                    return
                                end
                                local new_path = Path:new(file)

                                if old_path.filename == new_path.filename then
                                    fb_utils.notify("action.rename", {
                                        msg = string.format("Name of selection unchanged! Skipping.",
                                            new_path.filename:sub(#new_path:parent().filename + 2)),
                                        level = "WARN",
                                        quiet = quiet
                                    })
                                    return
                                end
                                if new_path:exists() then
                                    fb_utils.notify("action.rename", {
                                        msg = string.format("%s already exists! Skipping.",
                                            new_path.filename:sub(#new_path:parent().filename + 2)),
                                        level = "WARN",
                                        quiet = quiet
                                    })
                                    return
                                end

                                -- rename changes old_name in place
                                local old_name = old_path:absolute()

                                -- old_path:rename{
                                --     new_name = new_path.filename
                                -- }

                                require('typescript').renameFile(old_name, new_path.filename);

                                -- if not new_path:is_dir() then
                                --     fb_utils.rename_buf(old_name, new_path:absolute())
                                -- else
                                --     fb_utils.rename_dir_buf(old_name, new_path:absolute())
                                -- end

                                -- persist multi selections unambiguously by only removing renamed entry
                                if current_picker:is_multi_selected(entry) then
                                    current_picker._multi:drop(entry)
                                end
                                fb_utils.selection_callback(current_picker, new_path:absolute())
                                current_picker:refresh(current_picker.finder)
                            end)
                        end
                    end,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
}
telescope.load_extension("file_browser")
vim.keymap.set('n', ';f', function()
    builtin.find_files({
        no_ignore = false,
        hidden = true
    })
end)
vim.keymap.set('n', ';r', function()
    builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
    builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
    builtin.help_tags()
end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = {
            height = 40
        }
    })
end)
