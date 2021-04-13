-- This is a modified config. Edit it on your own. I am using a sysimage here so go 
-- to https://discourse.julialang.org/t/neovim-native-lsp-with-julials-using-packagecompiled-languageserver/57659
-- for further instructions
require'lspconfig'.julials.setup({
      on_new_config = function(new_config,new_root_dir)
      server_path = "/home/tricks/.julia/packages/LanguageServer/y1ebo/src/"
      cmd = {
        "julia",
        "--project="..server_path,
        "--startup-file=no",
        "--history-file=no",
        "--sysimage=/home/tricks/Developer/Julia/julials.so",
        "--sysimage-native-code=yes",
        "-e", [[
          using Pkg;
          Pkg.instantiate()
          using LanguageServer; using SymbolServer;
          depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
          project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
          # Make sure that we only load packages from this environment specifically.
          @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
          server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
          server.runlinter = true;
          run(server);
        ]]
    };
    new_config.cmd = cmd
    on_attach=require'completion'.on_attach
    end
})
