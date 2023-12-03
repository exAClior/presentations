### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 5b60b904-918c-11ee-2d1b-c382c891cbb8
begin
    using Pkg; Pkg.activate(".")
	using Revise
    using PlutoUI, BenchmarkTools, Random
    using ZXCalculus, ZXCalculus.ZX, YaoPlots, Yao
end


# ╔═╡ 7106a0c4-389a-4e8e-8f43-77fdb5458913
html"<button onclick='present()'>present</button>"

# ╔═╡ 7cba7495-d9be-4031-8e32-54384d8e8e5e
md"#Self Introduction
What's my name
What's my affliation
I will talk about ZXCalculus.jl
"

# ╔═╡ 1eeb564c-7dd8-4565-9d63-9fad8c8e3a6b
md"#Overview
Talk about ZXCalculus and its applications
Use package as example
"

# ╔═╡ aa055b7a-ba85-448e-8031-12ec3979e953
md"#Package Introduction
What's the history of this package
Dr. Chen Zhao, Roger Luo
Entering me: 2023 summer time
......



"

# ╔═╡ 87538743-fed0-4db1-bc6b-a2f76b68cd5a
md"#Brief Introduction to ZXCalculus
What is it, basic elements ...

"

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


# ╔═╡ Cell order:
# ╟─7106a0c4-389a-4e8e-8f43-77fdb5458913
# ╠═5b60b904-918c-11ee-2d1b-c382c891cbb8
# ╠═7cba7495-d9be-4031-8e32-54384d8e8e5e
# ╠═1eeb564c-7dd8-4565-9d63-9fad8c8e3a6b
# ╠═aa055b7a-ba85-448e-8031-12ec3979e953
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
