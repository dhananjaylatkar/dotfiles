return {
  "dhananjaylatkar/notes.nvim",
  enabled = vim.g.dha.conf.enable.notes,
  cmd = { "NotesFind", "NotesGrep", "NotesNew" },
  opts = vim.g.dha.conf.notes.opts,
}
