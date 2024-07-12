# Julia (Julialang) REPL startup file
# Should be placed in ~/.julia/config/startup.jl

atreplinit() do repl
    @eval using Revise, OhMyREPL
    redirect_stdio(stderr=devnull) do
        @eval using AbbreviatedStackTraces
    end
end
