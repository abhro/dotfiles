# Julia (Julialang) REPL startup file
# Should be placed in ~/.julia/config/startup.jl

atreplinit() do repl
    @eval using Revise, OhMyREPL
    redirect_stdio(stderr=devnull) do
        @eval using AbbreviatedStackTraces
    end
end

function template()
    @eval begin
        using PkgTemplates
        Template(
            user = "abhro",
            authors = "Abhro R. and contributors",
            dir = joinpath(homedir(), "src"),
            host = "github.com",
            julia = v"1.10.0",
            plugins = [
                Citation(),
                Codecov(),
                CompatHelper(),
                Dependabot(),
                Documenter{GitHubActions}(),
                Git(),
                GitHubActions(),
                License(name = "MIT"),
                PkgBenchmark(),
                PkgEvalBadge(),
                ProjectFile(version = v"0.0.0-DEV"),
                Readme(),
                SrcDir(),
                TagBot(),
                Tests(project = true, aqua = true),
            ],
        )
    end
end
