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

# ╔═╡ 87538743-fed0-4db1-bc6b-a2f76b68cd5a
md"""# Brief Introduction to ZXCalculus
What is it, basic elements ...

"""

# ╔═╡ 539f7688-6680-4298-b695-447019ebe4af
md"#Applications of ZXCalculus
## MBQC
"

# ╔═╡ 9b9e1445-be58-42f1-b76e-13e644438be9
md"## circuit simplification
"

# ╔═╡ 0a82ec5e-13e2-4635-a34f-7fd89a6f411e
md"## Others

"

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
# ╠═87538743-fed0-4db1-bc6b-a2f76b68cd5a
# ╠═539f7688-6680-4298-b695-447019ebe4af
# ╠═9b9e1445-be58-42f1-b76e-13e644438be9
# ╠═0a82ec5e-13e2-4635-a34f-7fd89a6f411e
# ╠═dd1580cf-c7f3-4f2b-9141-09585ca7e36c
# ╠═759d5cef-c63c-4deb-9876-3707f21da8cd
# ╠═f41bd7ef-c4b6-44b0-a920-90f1dd5019e5
# ╠═b0d972d9-1d0d-461b-befa-384a3453778b
# ╠═d6eeb36e-f52b-46a1-9cbb-64c1eef5c1e7
# ╠═d9e41ac3-c3a4-41e3-abd8-5bdf41d27ab7
# ╠═c73a88a9-8251-47e9-a5fd-e6a83b1f528b
# ╠═a28cddd3-717e-4cd6-9178-77019818993f
# ╠═d516b5ed-69f9-41d7-8627-7df14a740e7c
