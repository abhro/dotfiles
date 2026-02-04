# Julia (Julialang) REPL startup file
# Should be placed in ~/.julia/config/startup.jl

import Pkg

atreplinit() do repl
    @eval using Revise, OhMyREPL
    redirect_stdio(stderr=devnull) do
        @eval using AbbreviatedStackTraces
    end
end

function template()
    @eval begin
        using PkgTemplates
        plugins = [
            Citation(),
            Codecov(),
            Dependabot(),
            Documenter{GitHubActions}(),
            Git(),
            GitHubActions(linux = true, windows = true, osx = true),
            License(name = "MIT"),
            PkgEvalBadge(),
            ProjectFile(version = v"0.0.0-DEV"),
            Readme(),
            SrcDir(),
            TagBot(),
            Tests(project = true, aqua = true),
        ]
        Template(;
            user = "abhro",
            authors = "Abhro R. and contributors",
            dir = joinpath(homedir(), "src"),
            host = "github.com",
            julia = v"1.10.0",
            plugins,
        )
    end
end
