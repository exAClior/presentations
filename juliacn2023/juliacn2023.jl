### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 5b60b904-918c-11ee-2d1b-c382c891cbb8
begin
    using Pkg; Pkg.activate(".")
	using Revise
    using PlutoUI, PlutoTeachingTools
	using BenchmarkTools, Random
    using ZXCalculus, ZXCalculus.ZX, YaoPlots, Yao
end;

# ╔═╡ 3967f9c9-5f72-4406-83f0-7cd0cd9648ce
begin
	using ZXCalculus.ZXW
	using ZXCalculus.ZXW:Z, add_spider!, Parameter, insert_spider!, add_edge!, rewrite!, match
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
	pathintro= "figs/zxintro.png"
	urltp = "https://t3.ftcdn.net/jpg/02/61/08/76/360_F_261087622_8eRI0TAwDAyabS1b0Uifx1wKqHzA41r3.jpg"
	pathzsp = "figs/z-spider.png"
	pathxsp = "figs/x-spider.png"
end;

# ╔═╡ 87538743-fed0-4db1-bc6b-a2f76b68cd5a
md"""# Introduction to ZX-calculus
## ZX-calculus
- **Calculus**: "mathematical study of continuous change" [^fn1]
- **演算**: "依照一定的原理、公式计算" [^fn2]
- **Example**: $x^2+2xy + y^2 = (x+y)^2$
- **Z Tensor**: $(RobustLocalResource(urltp, pathzsp,:width=>800,:align=>:center, :alt=>"Z Spider", cache=false))
- **X Tensor**: $(RobustLocalResource(urltp, pathxsp,:width=>800,:align=>:center, :alt=>"X Spider", cache=false))
"""

# ╔═╡ 706f074a-95ea-4d3a-8ef6-b355f1723a01
begin
	urlspds = ""
	pathspds = "figs/spiders.png"
end;

# ╔═╡ 9cd983bf-063c-414e-8bd9-5cb66a3524a1
md"""## ZX-Diagrams
- Z "Spider" and X "Spider" (separate): $(RobustLocalResource(urlintro, pathspds,:width=>800, :align=>:center, :alt=>"Spiders", cache=false))
- Only connectivity matters, but circuit convention, 
- Graphical Representations of a specialized Tensor Networks
"""

# ╔═╡ d8c73fec-928f-4174-a737-be2e1de0589e
begin
	pathtable = "figs/table.png"
end;

# ╔═╡ 6330319d-9425-4619-95cc-7f5bd7eca9bf
md"""## From Quantum Circuit to ZX-Diagram
- Direct translation from Quantum Gates into Spiders
- Examples: $(RobustLocalResource(urlintro, pathtable,:width=>500, :align=>:center, :alt=>"Translation table", cache=false))
- Universality (give other's reference on linear map universality. Some of ZX Calculus is not . QMA complete)
"""

# ╔═╡ f7eddc42-beb9-4fdd-8b68-c81c55907e41
#use ZXCalculus.jl to show cnot gate matrix rep is the same as zx 
#also give H and point out it's a syntax sugar

# ╔═╡ 11f63c7e-f648-4f1d-b09d-3ec15a613174
md"""## Example of Translation
$(RobustLocalResource(urlintro, pathintro,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
- Why do we translate?
"""

# ╔═╡ 1607afe4-9e58-4211-b471-83a4c6f504aa
begin
	pathzxrule = "figs/ZX-rules.png"
end;

# ╔═╡ 3213c733-672a-4eca-9381-1a690d666eed
md"""## Rewrite Rules(Calculus)
- **Rules**: $(RobustLocalResource(urlintro, pathzxrule,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
- What's the use. connect to previous algebra example
- **Completeness**: "A graphical calculus is complete when its rewrite rules are powerful enough to prove any true equation."[^ZXWorking]
- **Practical Implication**: Equivalence of Linear Maps through Transformative Sequences in ZX Diagrams

"""

# ╔═╡ 5a01eef2-8893-4ecc-ac0b-7c1320852068
begin
	pathfusion = "figs/fusion.png"
end;

# ╔═╡ 51b2c6b7-78f4-401e-899b-dab3bd8a4208
begin
	zxwd = ZXWDiagram(2)
	insert_spider!(zxwd,1,2,Z(Parameter(Val(:PiUnit),-2)))
	insert_spider!(zxwd,3,4,Z(Parameter(Val(:PiUnit),1)))
	add_edge!(zxwd,5,6)
end;

# ╔═╡ 0d78bec4-e737-4eef-aa9a-b0d2bb50c309
vizcircuit(zxwd;graphwidth=10,graphheight=5,density=0.1)

# ╔═╡ bfdf1671-d300-44db-8d2b-9e5fe5cdbed3
begin
	zxwd2 = copy(zxwd)
	matched_pos = match(Rule(:s1),zxwd2)
	zxwd2 = rewrite!(Rule(:s1),zxwd2,matched_pos)
end

# ╔═╡ 548182df-6533-4d84-8373-8e0678c3cf82
vizcircuit(zxwd2;graphwidth=10,graphheight=5,density=0.1)#change color

# ╔═╡ ca477e83-5bf0-42ef-8f59-6446241b97ef
@assert to_matrix(zxwd) ≈ to_matrix(zxwd2)

# ╔═╡ 04347137-2e50-4c9f-b270-9a237b0ca0d3
# what I did, ZXW Calculus, W calculus definition + reference

# ╔═╡ 96ac3039-6a4d-4f06-94a2-f0369ff414c3
begin
	pathmag = "figs/magicinjection.png"
	pathmagzx = "figs/magicinjectionzx.png"
end;

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

# ╔═╡ 3b6c88e7-6d8a-46a8-a3fb-b396c611aa09
begin
	urlcz = "https://avatars.githubusercontent.com/u/50411747?v=4"
	pathcz = "figs/ChenZhao44.jpeg"
	urlrl = "https://twitter.com/rogerluorl18/photo"
	pathrl = "figs/RogerLuo.jpg"
end;

# ╔═╡ d516b5ed-69f9-41d7-8627-7df14a740e7c
md"""# Summary & Credits
- Originally developed by 
|Dr. [Chen Zhao](https://github.com/ChenZhao44) |[Xiu-zhe (Roger) Luo](https://github.com/Roger-luo)|
|--------------|------------------|
|$(RobustLocalResource(urlcz, pathcz,:width=>200, :alt=>"Dr. Chen Zhao", cache=false))|$(RobustLocalResource(urlrl, pathrl, :width=>200, :alt=>"Xiuzhe (Roger) Luo", cache=false))|
- My Mentor Chen Zhao during the project
Thank you!
"""

# ╔═╡ f6312a2b-5aed-4867-8278-089ca7ad652b
md"""# Footnotes (remove !)
"""

# ╔═╡ 10af6d43-453e-46e0-b983-eb00c53e8a68
md"""
[^ZXWorking]: van de Wetering, John. "ZX-calculus for the working quantum computer scientist." arXiv preprint arXiv:2012.13966 (2020).
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
# ╟─87538743-fed0-4db1-bc6b-a2f76b68cd5a
# ╟─706f074a-95ea-4d3a-8ef6-b355f1723a01
# ╠═9cd983bf-063c-414e-8bd9-5cb66a3524a1
# ╟─d8c73fec-928f-4174-a737-be2e1de0589e
# ╠═6330319d-9425-4619-95cc-7f5bd7eca9bf
# ╠═f7eddc42-beb9-4fdd-8b68-c81c55907e41
# ╟─11f63c7e-f648-4f1d-b09d-3ec15a613174
# ╟─1607afe4-9e58-4211-b471-83a4c6f504aa
# ╠═3213c733-672a-4eca-9381-1a690d666eed
# ╟─5a01eef2-8893-4ecc-ac0b-7c1320852068
# ╠═3967f9c9-5f72-4406-83f0-7cd0cd9648ce
# ╠═51b2c6b7-78f4-401e-899b-dab3bd8a4208
# ╠═0d78bec4-e737-4eef-aa9a-b0d2bb50c309
# ╠═bfdf1671-d300-44db-8d2b-9e5fe5cdbed3
# ╠═548182df-6533-4d84-8373-8e0678c3cf82
# ╠═ca477e83-5bf0-42ef-8f59-6446241b97ef
# ╠═04347137-2e50-4c9f-b270-9a237b0ca0d3
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
