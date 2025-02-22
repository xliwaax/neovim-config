local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort.with({ extra_args = {"--profile", "black", "--line-length", "100"} }),
    null_ls.builtins.formatting.stylua,
  },
})
