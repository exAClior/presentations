### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 5b60b904-918c-11ee-2d1b-c382c891cbb8
begin
    using Pkg; Pkg.activate(".")
	using Revise
    using PlutoUI, PlutoTeachingTools
	using BenchmarkTools, Random, Latexify
    using ZXCalculus, ZXCalculus.ZX, YaoPlots, Yao
end;

# ╔═╡ 3967f9c9-5f72-4406-83f0-7cd0cd9648ce
begin
	using ZXCalculus.ZXW
	using ZXCalculus.ZXW:Z, add_spider!, Parameter, insert_spider!, add_edge!, rewrite!, match, insert_wtrig!, substitute_variables!
	using ZXCalculus.Application: to_matrix
end;

# ╔═╡ 0f6ad1ea-39b2-4197-8f00-5afa55839be2
ChooseDisplayMode()

# ╔═╡ fe1cc35d-4372-404d-bacb-bf96e7423e23
html"""
	<h1 style="text-align:center">
		ZXCalculus.jl: ZX-calculus in Julia
	</h1>
	<div style="text-align:center">
		<p style="font-weight:bold; font-size: 35px; font-variant: small-caps; margin: 0px">
			A Starter Kit in Graphical Language
		</p>
		<p style="font-size: 30px; font-variant: small-caps; margin: 0px">
			Yusheng Zhao
		</p>
        <p style="font-size: 14px; font-variant: small-caps; margin: 0px">
            Hong Kong University of Science and Technology(GuangZhou)
        </p>
		<p style="font-size: 20px;">
			JuliaCN Winter Meetup, Shenzhen, 2023/12/09
		</p>
		<img src="https://cn.julialang.org/assets/infra/logo_cn.png" alt="JuliaCN Logo" style="width: 200px; height: auto;">
		<img src="https://summer-ospp.ac.cn/help/en/assets/logo.svg" alt="OSPP Logo" style="width: 130px; height: auto;"> <br>
	</div>
"""

# ╔═╡ 7636ca8e-04a8-443a-a7f6-e7fbd70ebce6
TableOfContents(title="Outline",depth=1)

# ╔═╡ e3469b40-b693-4230-a2f5-4e6c1b21619c
md"""# URLS (remove it!)

"""

# ╔═╡ 166384c5-b083-4792-a397-2f9495a3bc7b
begin
	urlintro = "https://chenzhao44.github.io/assets/blog_res/ZX/QC_to_ZX.png"
	urlcz = "https://avatars.githubusercontent.com/u/50411747?v=4"
	urltp = "https://t3.ftcdn.net/jpg/02/61/08/76/360_F_261087622_8eRI0TAwDAyabS1b0Uifx1wKqHzA41r3.jpg"
	urlrl = "https://twitter.com/rogerluorl18/photo"
	urlspds = ""
	pathintro= "figs/zxintro.png"
	pathzsp = "figs/z-spider.png"
	pathxsp = "figs/x-spider.png"
	pathzxrule = "figs/ZX-rules.png"
	pathspds = "figs/spiders.png"
	pathtable = "figs/table.png"
	pathmag = "figs/magicinjection.png"
	pathmagzx = "figs/magicinjectionzx.png"
	pathcz = "figs/ChenZhao44.jpeg"
	pathrl = "figs/RogerLuo.jpg"
	pathhad = "figs/hadamard.png"
	pathfusion = "figs/fusion.png"
end;

# ╔═╡ 87538743-fed0-4db1-bc6b-a2f76b68cd5a
md"""# Introduction to ZX-calculus
## ZX-calculus
- **Calculus**: "mathematical study of continuous change" [^fn1]
- **演算**: "依照一定的原理、公式计算" [^fn2]
- **Example**: $\cos(\theta)^2 + \sin(\theta)^2 = 1$
- **Z Tensor**: $(RobustLocalResource(urltp, pathzsp,:width=>800,:align=>:center, :alt=>"Z Spider", cache=false))
- **X Tensor**: $(RobustLocalResource(urltp, pathxsp,:width=>800,:align=>:center, :alt=>"X Spider", cache=false))
"""

# ╔═╡ 6330319d-9425-4619-95cc-7f5bd7eca9bf
md"""## Gates to ZX-Tensors
- $(RobustLocalResource(urlintro, pathtable,:width=>500, :align=>:center, :alt=>"Translation table", cache=false))
- **Syntax Sugar**: $(RobustLocalResource(urltp, pathhad,:width=>300, :align=>:center, :alt=>"Translation table", cache=false))
"""

# ╔═╡ b202bd88-2cb7-4a61-b0e1-58fe28f86694
md"""## CNOT
"""

# ╔═╡ 706f074a-95ea-4d3a-8ef6-b355f1723a01
begin
	cnot_diagram = ZXWDiagram(2)
	push_gate!(cnot_diagram,Val(:CNOT),1,2)
	cnot_diagram_sem = round.(to_matrix(cnot_diagram);digits=5)
	latexify(cnot_diagram_sem)
end


# ╔═╡ 578abf2a-7689-4ca6-97ce-f46e6d09c2f3
vizcircuit(cnot_diagram; fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)

# ╔═╡ 07d1c636-d75d-4cf9-bd6f-6ff7ad3c71f9
md"""## Hadamard
"""

# ╔═╡ 70f24e1d-e9b9-469d-bdfe-5ac58c2cc3b3
begin
	hadamard_diagram = ZXWDiagram(1)
	push_gate!(hadamard_diagram,Val(:Z),1,1//2)
	push_gate!(hadamard_diagram,Val(:X),1,1//2)
	push_gate!(hadamard_diagram,Val(:Z),1,1//2)
	hadamard_diagram_sem = round.(exp(-im*π/4).*to_matrix(hadamard_diagram);digits=5)
	latexify(hadamard_diagram_sem)
end

# ╔═╡ 5a460cd4-3339-47e2-99ed-551cd2c6ef8d
vizcircuit(hadamard_diagram;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)

# ╔═╡ ca74bef6-1c75-4d55-8b84-e309a9fecf2a
md"""## Universality
- Quantum Circuits
- Arbitrary Linear Map: $2^n \rightarrow 2^m$ too! [^LMUniv]
- "Circuit Extraction is #P-hard" [^CircExtra]
"""

# ╔═╡ 11f63c7e-f648-4f1d-b09d-3ec15a613174
md"""## Circuit translation example
- $(RobustLocalResource(urlintro, pathintro,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
- **ZX-Diagram**: A multigraph, a graph which is permitted to have edges that have the same end nodes, with vertices being Z and X tensors.
- **What's the purpose**?
"""

# ╔═╡ 3213c733-672a-4eca-9381-1a690d666eed
md"""## Rewrite Rules 
- **Rules**: $(RobustLocalResource(urlintro, pathzxrule,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
- **Recall**: $\cos(\theta)^2 + \sin(\theta)^2 = 1$
- **Completeness**: "A graphical calculus is complete when its rewrite rules are powerful enough to prove any true equation."[^ZXWorking]
- **Practical Implication**: If two ZX-Diagrams are _equal_, the above rewrite rules suffices to transform one to another.

"""

# ╔═╡ 51b2c6b7-78f4-401e-899b-dab3bd8a4208
begin
	zxd = ZXWDiagram(2)
	insert_spider!(zxd,1,2,Z(Parameter(Val(:PiUnit),1//2)))
	insert_spider!(zxd,3,4,Z(Parameter(Val(:PiUnit),-1//2)))
	add_edge!(zxd,5,6)
end;

# ╔═╡ 0d78bec4-e737-4eef-aa9a-b0d2bb50c309
vizcircuit(zxd;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)

# ╔═╡ bfdf1671-d300-44db-8d2b-9e5fe5cdbed3
begin
	zxd2 = copy(zxd)
	matched_pos = match(Rule(:s1),zxd2)
	zxd2 = rewrite!(Rule(:s1),zxd2,matched_pos)
end;

# ╔═╡ 548182df-6533-4d84-8373-8e0678c3cf82
vizcircuit(zxd2;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)

# ╔═╡ 019de6e9-c36a-4c37-86f8-6a5d4f03ebdc
@assert to_matrix(zxd) ≈ to_matrix(zxd2)

# ╔═╡ 96ac3039-6a4d-4f06-94a2-f0369ff414c3


# ╔═╡ c7fe41a9-4b2d-4de4-8657-f6d1a831cfc2
md"""## Applications
### Understanding Magic State Injection
- $(RobustLocalResource(urlintro, pathmag,:width=>300, :align=>:center, :alt=>"Translation table", cache=false)) 
- $(RobustLocalResource(urlintro, pathmagzx,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
"""

# ╔═╡ fb8fc69c-a77f-4442-8ed3-ff1d5ae3911c
begin
	mizxwd = ZXWDiagram(2)
	push_gate!(mizxwd,Val(:Z),2,1//4)
	push_gate!(mizxwd,Val(:CNOT),2,1)
	push_gate!(mizxwd,Val(:Z),1,1//2)
	push_gate!(mizxwd,Val(:X),2,1)
end;

# ╔═╡ c399194e-cd90-44ca-90ac-7c12e515d72b
mizxwd.mg

# ╔═╡ 2340c1ba-d90b-4f57-9446-5d4ed8513ed6
vizcircuit(mizxwd; verbose=true)# white background

# ╔═╡ 219bd61d-da08-4b04-b271-bc6a52c3c29b
begin
	mizxwd2 = copy(mizxwd)
	mimatched_pos = match(Rule(:s1),mizxwd2)
	println(mimatched_pos)
	mizxwd2 = rewrite!(Rule(:s1),mizxwd2,mimatched_pos)
end

# ╔═╡ ba42651d-c52b-4b5a-b9bc-88d412f24fbe
begin
	mizxwd3 = copy(mizxwd)
	mimatched_pos3 = match(Rule(:s1),mizxwd3)
	println(mimatched_pos3)
	mizxwd3 = rewrite!(Rule(:s1),mizxwd3,[mimatched_pos3[1]])
end

# ╔═╡ f878297f-3ce9-4011-a6d4-cd431e24b9a7
length(mizxwd3.st)

# ╔═╡ 560545c2-51da-434a-9324-3540d9857c79
length(mizxwd2.st)

# ╔═╡ 1350756d-6a2b-4a15-b0e0-db8ec1baa333
vizcircuit(mizxwd3;verbose=true)

# ╔═╡ ab4f76a8-10c5-4dee-8b99-446bb095a65c
md"""### Circuit Simplification
- Via Phase Teleporation
"""

# ╔═╡ 02390a36-06fe-4fb7-b00f-46461542a8aa
md"""# ZXW-Calculus: Other Flavors of graphical Language
- Why need other flavors of Calculus
"""

# ╔═╡ 2ba578c3-1ae0-45f7-aec8-445fabf7a911
md"""## Extra Spiders

"""

# ╔═╡ 2b818577-8ba6-4939-b6ff-2572b169ab63
md"""## Application
- gradient calculation

"""

# ╔═╡ d516b5ed-69f9-41d7-8627-7df14a740e7c
md"""# Summary & Credits
- Authors of ZXCalculus: 
|Dr. [Chen Zhao](https://github.com/ChenZhao44) |[Xiu-zhe (Roger) Luo](https://github.com/Roger-luo)|
|--------------|------------------|
|$(RobustLocalResource(urlcz, pathcz,:width=>200, :alt=>"Dr. Chen Zhao", cache=false))|$(RobustLocalResource(urlrl, pathrl, :width=>200, :alt=>"Xiuzhe (Roger) Luo", cache=false))|
- Dr. Chen Zhao mentored me during the OSPP project
- _Thank you for your attention_!
"""

# ╔═╡ 3b6c88e7-6d8a-46a8-a3fb-b396c611aa09


# ╔═╡ f6312a2b-5aed-4867-8278-089ca7ad652b
md"""# Footnotes (remove !)
"""

# ╔═╡ 10af6d43-453e-46e0-b983-eb00c53e8a68
md"""
[^ZXWorking]: van de Wetering, John. "ZX-calculus for the working quantum computer scientist." arXiv preprint arXiv:2012.13966 (2020).
[^LMUniv]: Coecke, Bob, and Ross Duncan. "Interacting quantum observables: categorical algebra and diagrammatics." New Journal of Physics 13.4 (2011): 043016.
[^CircExtra]: Coecke, Bob, and Ross Duncan. "Interacting quantum observables: categorical algebra and diagrammatics." New Journal of Physics 13.4 (2011): 043016.
[^fn1]: https://en.wikipedia.org/wiki/Calculus
[^fn2]: Oxford Languages
"""

# ╔═╡ 6bbf81a9-1fa8-4b83-8663-307ed886446a
md"""## Soundness
- **Definition of Soundness**: "A rewrite rule is sound when it preserves the underlying semantics."[^ZXWorking]
- **Semantics in ZX-Calculus**: Representation of Linear Maps Demonstrating Soundness through ZXCalculus.jl:
- **Example**: Fusion Rule $(RobustLocalResource(urlintro, pathfusion,:width=>300, :align=>:center, :alt=>"Translation table", cache=false))
- Code Demonstration in ZXCalculus.jl
"""

# ╔═╡ Cell order:
# ╟─5b60b904-918c-11ee-2d1b-c382c891cbb8
# ╟─0f6ad1ea-39b2-4197-8f00-5afa55839be2
# ╟─fe1cc35d-4372-404d-bacb-bf96e7423e23
# ╟─7636ca8e-04a8-443a-a7f6-e7fbd70ebce6
# ╟─e3469b40-b693-4230-a2f5-4e6c1b21619c
# ╠═166384c5-b083-4792-a397-2f9495a3bc7b
# ╠═87538743-fed0-4db1-bc6b-a2f76b68cd5a
# ╟─6330319d-9425-4619-95cc-7f5bd7eca9bf
# ╟─b202bd88-2cb7-4a61-b0e1-58fe28f86694
# ╠═706f074a-95ea-4d3a-8ef6-b355f1723a01
# ╠═578abf2a-7689-4ca6-97ce-f46e6d09c2f3
# ╟─07d1c636-d75d-4cf9-bd6f-6ff7ad3c71f9
# ╠═70f24e1d-e9b9-469d-bdfe-5ac58c2cc3b3
# ╠═5a460cd4-3339-47e2-99ed-551cd2c6ef8d
# ╟─ca74bef6-1c75-4d55-8b84-e309a9fecf2a
# ╟─11f63c7e-f648-4f1d-b09d-3ec15a613174
# ╟─3213c733-672a-4eca-9381-1a690d666eed
# ╟─3967f9c9-5f72-4406-83f0-7cd0cd9648ce
# ╠═51b2c6b7-78f4-401e-899b-dab3bd8a4208
# ╠═0d78bec4-e737-4eef-aa9a-b0d2bb50c309
# ╠═bfdf1671-d300-44db-8d2b-9e5fe5cdbed3
# ╠═548182df-6533-4d84-8373-8e0678c3cf82
# ╠═019de6e9-c36a-4c37-86f8-6a5d4f03ebdc
# ╟─96ac3039-6a4d-4f06-94a2-f0369ff414c3
# ╟─c7fe41a9-4b2d-4de4-8657-f6d1a831cfc2
# ╠═fb8fc69c-a77f-4442-8ed3-ff1d5ae3911c
# ╠═c399194e-cd90-44ca-90ac-7c12e515d72b
# ╠═2340c1ba-d90b-4f57-9446-5d4ed8513ed6
# ╠═219bd61d-da08-4b04-b271-bc6a52c3c29b
# ╠═ba42651d-c52b-4b5a-b9bc-88d412f24fbe
# ╠═f878297f-3ce9-4011-a6d4-cd431e24b9a7
# ╠═560545c2-51da-434a-9324-3540d9857c79
# ╠═1350756d-6a2b-4a15-b0e0-db8ec1baa333
# ╟─ab4f76a8-10c5-4dee-8b99-446bb095a65c
# ╠═02390a36-06fe-4fb7-b00f-46461542a8aa
# ╠═2ba578c3-1ae0-45f7-aec8-445fabf7a911
# ╠═2b818577-8ba6-4939-b6ff-2572b169ab63
# ╟─d516b5ed-69f9-41d7-8627-7df14a740e7c
# ╟─3b6c88e7-6d8a-46a8-a3fb-b396c611aa09
# ╟─f6312a2b-5aed-4867-8278-089ca7ad652b
# ╠═10af6d43-453e-46e0-b983-eb00c53e8a68
# ╠═6bbf81a9-1fa8-4b83-8663-307ed886446a
