### A Pluto.jl notebook ###
# v0.19.29

using Markdown
using InteractiveUtils

# ╔═╡ ba67ced0-958b-11ee-31df-07b203898e73
begin
    using Pkg; Pkg.activate(".")
	using Revise
    using PlutoUI, PlutoTeachingTools
	using BenchmarkTools, Random, Latexify
    using ZXCalculus, ZXCalculus.ZX, YaoPlots, Yao
	using ZXCalculus.ZX: Phase
end;

# ╔═╡ f1518308-6f09-4015-9528-3d5714b54e67
begin
	mizxd = ZXDiagram(1)
	ZX.insert_spider!(mizxd,1,2,SpiderType.Z,Phase(0))
	vizcircuit(mizxd;verbose=true,fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)
end

# ╔═╡ Cell order:
# ╠═ba67ced0-958b-11ee-31df-07b203898e73
# ╠═f1518308-6f09-4015-9528-3d5714b54e67
