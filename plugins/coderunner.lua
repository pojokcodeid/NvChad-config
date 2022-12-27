require("code_runner").setup {
  -- put here the commands by filetype
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    javascript = "node $fileName",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    -- cpp="gcc $fileName -lstdc++ -o $fileNameWithoutExt && $fileNameWithoutExt"
    cpp = "g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    scss = "sass $dir/$fileName $dir/$fileNameWithoutExt.css",
  },
}
