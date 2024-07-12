# Julia (Julialang) REPL startup file
# Should be placed in ~/.julia/config/startup.jl

using Revise
using OhMyREPL
redirect_stdio(stderr=devnull) do
    @eval using AbbreviatedStackTraces
end
