local status_ok, auto_tag = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

auto_tag.setup {
  autotag = {
    enable = true,
  },
}
