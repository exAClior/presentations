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
end


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
	</div>
"""

# ╔═╡ 7636ca8e-04a8-443a-a7f6-e7fbd70ebce6
TableOfContents(title="Outline",aside=false)

# ╔═╡ 3b6c88e7-6d8a-46a8-a3fb-b396c611aa09
begin
	urlcz = "https://avatars.githubusercontent.com/u/50411747?v=4"
	pathcz = "figs/ChenZhao44.jpeg"
end;

# ╔═╡ bd7c63de-cb71-41d2-ae99-8b8807513f25
begin
	urlrl = "https://twitter.com/rogerluorl18/photo"
	pathrl = "figs/RogerLuo.jpg"
end;

# ╔═╡ aa055b7a-ba85-448e-8031-12ec3979e953
md"""# Package Introduction
|Dr. [Chen Zhao](https://github.com/ChenZhao44) |[Xiu-zhe (Roger) Luo](https://github.com/Roger-luo)|
|--------------|------------------|
|$(RobustLocalResource(urlcz, pathcz,:width=>200, :alt=>"Dr. Chen Zhao", cache=false))|$(RobustLocalResource(urlrl, pathrl, :width=>200, :alt=>"Xiuzhe (Roger) Luo", cache=false))|
"""

# ╔═╡ 166384c5-b083-4792-a397-2f9495a3bc7b
begin
	urlintro = "https://chenzhao44.github.io/assets/blog_res/ZX/QC_to_ZX.png"
	pathintro= "figs/zxintro.png"
end;

# ╔═╡ 87538743-fed0-4db1-bc6b-a2f76b68cd5a
md"""# Introduction to ZXCalculus
## ZX-calculus
- Graphical Language for Tensor Network
- Components of the language:
   1) ZX-Diagram
   2) Rewrite rules
$(RobustLocalResource(urlintro, pathintro,:width=>800, :alt=>"Circ2Diag", cache=false))
"""

# ╔═╡ 706f074a-95ea-4d3a-8ef6-b355f1723a01
begin
	urlspds = ""
	pathspds = "figs/spiders.png"
end;

# ╔═╡ 9cd983bf-063c-414e-8bd9-5cb66a3524a1
md"""## ZX-Diagrams
- Graphical Representations of Tensor Networks
- Tensors Parameterized by:
  1) Number of Legs
  2) Angles of Rotation (where applicable)
- Spiders: $(RobustLocalResource(urlintro, pathspds,:width=>800, :align=>:center, :alt=>"Spiders", cache=false))
"""

# ╔═╡ d8c73fec-928f-4174-a737-be2e1de0589e
begin
	pathtable = "figs/table.png"
end;

# ╔═╡ 6330319d-9425-4619-95cc-7f5bd7eca9bf
md"""## From Quantum Circuit to ZX-Diagram
- Direct translation from Quantum Gates into Spiders
- Examples: $(RobustLocalResource(urlintro, pathtable,:width=>500, :align=>:center, :alt=>"Translation table", cache=false))
- Universality
"""

# ╔═╡ 11f63c7e-f648-4f1d-b09d-3ec15a613174
md"""## Example of Translation
$(RobustLocalResource(urlintro, pathintro,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
- Why?
"""

# ╔═╡ 3213c733-672a-4eca-9381-1a690d666eed
md"""## Rewrite Rules
- **Completeness**: "A graphical calculus is complete when its rewrite rules are powerful enough to prove any true equation."[^ZXWorking]
- **Practical Implication**: Equivalence of Linear Maps through Transformative Sequences in ZX Diagrams
- **Rules**:

"""

# ╔═╡ 10af6d43-453e-46e0-b983-eb00c53e8a68
md"""
[^ZXWorking]: van de Wetering, John. "ZX-calculus for the working quantum computer scientist." arXiv preprint arXiv:2012.13966 (2020).
"""

# ╔═╡ 6bbf81a9-1fa8-4b83-8663-307ed886446a
md"""## Soundness

"""

# ╔═╡ ab4f76a8-10c5-4dee-8b99-446bb095a65c
md"""## Applications
- Magic State Distillation
- Phase Teleporations

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

# ╔═╡ dd1580cf-c7f3-4f2b-9141-09585ca7e36c


# ╔═╡ 759d5cef-c63c-4deb-9876-3707f21da8cd


# ╔═╡ f41bd7ef-c4b6-44b0-a920-90f1dd5019e5


# ╔═╡ b0d972d9-1d0d-461b-befa-384a3453778b


# ╔═╡ d6eeb36e-f52b-46a1-9cbb-64c1eef5c1e7


# ╔═╡ d9e41ac3-c3a4-41e3-abd8-5bdf41d27ab7


# ╔═╡ c73a88a9-8251-47e9-a5fd-e6a83b1f528b


# ╔═╡ a28cddd3-717e-4cd6-9178-77019818993f


# ╔═╡ d516b5ed-69f9-41d7-8627-7df14a740e7c
md"""# Thank you!
"""

# ╔═╡ Cell order:
# ╟─5b60b904-918c-11ee-2d1b-c382c891cbb8
# ╟─0f6ad1ea-39b2-4197-8f00-5afa55839be2
# ╟─fe1cc35d-4372-404d-bacb-bf96e7423e23
# ╟─7636ca8e-04a8-443a-a7f6-e7fbd70ebce6
# ╟─3b6c88e7-6d8a-46a8-a3fb-b396c611aa09
# ╟─bd7c63de-cb71-41d2-ae99-8b8807513f25
# ╟─aa055b7a-ba85-448e-8031-12ec3979e953
# ╟─166384c5-b083-4792-a397-2f9495a3bc7b
# ╟─87538743-fed0-4db1-bc6b-a2f76b68cd5a
# ╟─706f074a-95ea-4d3a-8ef6-b355f1723a01
# ╟─9cd983bf-063c-414e-8bd9-5cb66a3524a1
# ╟─d8c73fec-928f-4174-a737-be2e1de0589e
# ╟─6330319d-9425-4619-95cc-7f5bd7eca9bf
# ╟─11f63c7e-f648-4f1d-b09d-3ec15a613174
# ╟─3213c733-672a-4eca-9381-1a690d666eed
# ╟─10af6d43-453e-46e0-b983-eb00c53e8a68
# ╠═6bbf81a9-1fa8-4b83-8663-307ed886446a
# ╠═ab4f76a8-10c5-4dee-8b99-446bb095a65c
# ╠═02390a36-06fe-4fb7-b00f-46461542a8aa
# ╠═2ba578c3-1ae0-45f7-aec8-445fabf7a911
# ╠═2b818577-8ba6-4939-b6ff-2572b169ab63
# ╠═dd1580cf-c7f3-4f2b-9141-09585ca7e36c
# ╠═759d5cef-c63c-4deb-9876-3707f21da8cd
# ╠═f41bd7ef-c4b6-44b0-a920-90f1dd5019e5
# ╠═b0d972d9-1d0d-461b-befa-384a3453778b
# ╠═d6eeb36e-f52b-46a1-9cbb-64c1eef5c1e7
# ╠═d9e41ac3-c3a4-41e3-abd8-5bdf41d27ab7
# ╠═c73a88a9-8251-47e9-a5fd-e6a83b1f528b
# ╠═a28cddd3-717e-4cd6-9178-77019818993f
# ╠═d516b5ed-69f9-41d7-8627-7df14a740e7c
