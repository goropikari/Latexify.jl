__precompile__()
module Latexify
import DiffEqBase, SymEngine, DataFrames
export latexify, latexarray, latexalign

import Base: show, endof, getindex, sizeof, search, rsearch, isvalid, next, length, IOBuffer, pointer
struct LaTeXString <: AbstractString
    s::String
end
show(io::IO, ::MIME"text/latex", s::LaTeXString) = print(io, "\$" * s.s * "\$")
endof(s::LaTeXString) = endof(s.s)
next(s::LaTeXString, i::Int) = next(s.s, i)
length(s::LaTeXString) = length(s.s)
getindex(s::LaTeXString, i::Int) = getindex(s.s, i)
getindex(s::LaTeXString, i::Integer) = getindex(s.s, i)
getindex(s::LaTeXString, i::Real) = getindex(s.s, i)
getindex(s::LaTeXString, i::UnitRange{Int}) = getindex(s.s, i)
getindex{T<:Integer}(s::LaTeXString, i::UnitRange{T}) = getindex(s.s, i)
getindex(s::LaTeXString, i::AbstractVector) = getindex(s.s, i)
sizeof(s::LaTeXString) = sizeof(s.s)
search(s::LaTeXString, c::Char, i::Integer) = search(s.s, c, i)
rsearch(s::LaTeXString, c::Char, i::Integer) = rsearch(s.s, c, i)
isvalid(s::LaTeXString, i::Integer) = isvalid(s.s, i)
pointer(s::LaTeXString) = pointer(s.s)
IOBuffer(s::LaTeXString) = IOBuffer(s.s)

include("latexify_function.jl")
include("latexoperation.jl")
include("latexarray.jl")
include("latexalign.jl")
end
