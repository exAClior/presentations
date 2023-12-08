### A Pluto.jl notebook ###
# v0.19.29

using Markdown
using InteractiveUtils

# ╔═╡ 5b60b904-918c-11ee-2d1b-c382c891cbb8
begin
    using Pkg; Pkg.activate(".")
	using Revise
    using PlutoUI, PlutoTeachingTools
	using BenchmarkTools, Random, Latexify
    using ZXCalculus, ZXCalculus.ZX, YaoPlots, Yao
	using ZXCalculus.ZX: Phase
end;

# ╔═╡ 3967f9c9-5f72-4406-83f0-7cd0cd9648ce
begin
	using ZXCalculus.ZXW
	using ZXCalculus.ZXW:Z, add_spider!, Parameter, insert_spider!, add_edge!, rewrite!, match, insert_wtrig!, substitute_variables!
	using ZXCalculus.Application: to_matrix
end;

# ╔═╡ c07c5b84-7bc6-40a2-ad65-9647a6280ffd
using ZXCalculus.ZX: phase_teleportation, tcount

# ╔═╡ c971cff3-13b9-45a0-b954-533ebef04c81
begin 
	using ZXCalculus.ZXW: expval_circ!, CalcRule, stack_zxwd!
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
	pathscalars = "figs/scalars.png"
	pathstatesp ="figs/state-spiders.png"
	pathex2 = "figs/ex2.svg"
	pathhadaedg = "figs/hadamard_edge.png"
	pathphgad = "figs/phase_gadget.png"
	pathlc = "figs/lc-simp.png"
	pathp1 = "figs/p1.png"
	pathp2 = "figs/p2.png"
	pathp3 = "figs/p3.png"
	pathidgf = "figs/id_gf.png"
	pathytrig = "figs/ytriange.png"
	pathbtrig = "figs/btriangle.png"
	pathbtrig_sug = "figs/btrig_sugar.png"
	pathzxw_add = "figs/addition.png"
	pathdiff_rule ="figs/diff_rule.png"
	pathint_rule = "figs/int_rule.png"
	pathansatz = "figs/ansatz_circ.png"
	pathftH = "figs/ftH.png"
	pathftcx = "figs/ftcx.png"
	
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

# ╔═╡ 8070ba67-191f-4a1b-bda2-e7c51da8b875
md"""### Figure
"""

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

# ╔═╡ 7eb910f9-a0d0-4e6b-9d06-b8af4e3b8e81
md"""### Figure
"""

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
	simp_fuse = ZXWDiagram(2)
	insert_spider!(simp_fuse,1,2,Z(Parameter(Val(:PiUnit),1//2)))
	insert_spider!(simp_fuse,3,4,Z(Parameter(Val(:PiUnit),-1//2)))
	add_edge!(simp_fuse,5,6)
end;

# ╔═╡ 0d78bec4-e737-4eef-aa9a-b0d2bb50c309
vizcircuit(simp_fuse;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)

# ╔═╡ bfdf1671-d300-44db-8d2b-9e5fe5cdbed3
begin
	simp_fuse_cp = copy(simp_fuse)
	matched_pos = match(Rule(:s1),simp_fuse_cp)
	rewrite!(Rule(:s1),simp_fuse_cp,matched_pos)
end;

# ╔═╡ 548182df-6533-4d84-8373-8e0678c3cf82
vizcircuit(simp_fuse_cp;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)

# ╔═╡ 019de6e9-c36a-4c37-86f8-6a5d4f03ebdc
@assert to_matrix(simp_fuse) ≈ to_matrix(simp_fuse_cp)

# ╔═╡ c3dd649b-d3d7-4676-a9e2-56b633f2c2f4
md"""## Applications
### Background 
- **Eastin–Knill theorem**: "no quantum error correcting code capable of detecting all local errors admits a universal set of transversal gates"[^StackExchange].
- **Transversal gates**: "a logical gate that can be implemented on a logical qubit by the independent action of separate physical gates on corresponding physical qubits"[^EKWiki].
- [^TheBible]: 
$(RobustLocalResource(urlintro, pathftH,:width=>275, :align=>:center, :alt=>"FT H", cache=false))
$(RobustLocalResource(urlintro, pathftcx,:width=>275, :align=>:center, :alt=>"FT H", cache=false)) 
- **A Universal Gateset**: Clifford + T
- **Clifford gates**: generated by CNOT, H, S which are implementable by error correction codes such as the Steane code [^TheBible].
- **T gate**: can be implemented using costly magic state distillation then magic state injection.[^MagicCosts]
- **Magic State Distillation**: 
"""

# ╔═╡ c7fe41a9-4b2d-4de4-8657-f6d1a831cfc2
md"""
### Visualizing Magic State Injection
- **Magic State Injection**: $(RobustLocalResource(urlintro, pathmag,:width=>500, :align=>:center, :alt=>"Translation table", cache=false)) 
- **Representing State in ZX**: $(RobustLocalResource(urlintro, pathstatesp,:width=>500, :align=>:center, :alt=>"Translation table", cache=false)) 

- $(RobustLocalResource(urlintro, pathmagzx,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
"""

# ╔═╡ b5a6723a-5be3-47fa-80b0-7b6da34f810d
begin
	mizxd = ZXDiagram(1)
	ZX.insert_spider!(mizxd,1,2,SpiderType.Z,Phase(0))
	ZX.add_spider!(mizxd,SpiderType.Z,Phase(1//4),)
	ZX.add_spider!(mizxd,SpiderType.X,Phase(0),[3,4])
	ZX.add_spider!(mizxd,SpiderType.X,Phase(1),[5])
	ZX.insert_spider!(mizxd,2,3,SpiderType.Z,Phase(1//2))
	vizcircuit(mizxd;verbose=true,fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)
end

# ╔═╡ 90cf6abb-3667-4a16-9683-c9f6f294bddc
begin
	mizxd2 = copy(mizxd)
	pos_f = match(Rule(:f),mizxd2)
	rewrite!(Rule(:f),mizxd2,pos_f)
	vizcircuit(mizxd2;verbose=true,fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)
end

# ╔═╡ e1664a56-1f86-4a6b-8458-f3821cd6129b
begin
	pos_pi = match(Rule(:pi),mizxd2)

	rewrite!(Rule(:pi),mizxd2,[pos_pi[2]])
	vizcircuit(mizxd2;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)
end

# ╔═╡ af65fcc7-dfcf-4eaf-8625-fea8646d887d
begin
	pos_f_2 = match(Rule(:f),mizxd2)
	rewrite!(Rule(:f),mizxd2,pos_f_2)
	vizcircuit(mizxd2;fontsize=15,bgcolor="white",linewidth=5,circsize=20,vrot=0.0)
end

# ╔═╡ 6efeb0f0-17a4-4597-b4de-0ec886f0104d
md"""#### Circuit Simplification with Phase Teleportation[^PhaseTele]
- **Recall**: T gates are costly with Steane Code
- **Hadamard Edge**: $(RobustLocalResource(urlintro, pathhadaedg,:width=>800, :align=>:center, :alt=>"Translation table", cache=false))
- **Phase Gadget**: $(RobustLocalResource(urlintro, pathphgad,:width=>300, :align=>:center, :alt=>"Translation table", cache=false))
- **Pauli vertices**: Tensors whose phase is a multiple of $\pi$.
- **Clifford vertices**: Tensors whose phase is a multiple of $\pi/2$.
- **Proper Clifford vertices**: Tensors whose phase is odd multiple of $\pi/2$.
- **Interior vertices**: A Tensor that is not connecting to an input or output spider.
- **Clifford phase-gadget**: Phase-gadgets with phases that is a multiple of $\pi/2$.
"""

# ╔═╡ 94e38c96-70fe-4033-ab0a-1ab4a65161cd
md"""#### Algorithm
1. Apply [^LC] until all interior profer Clifford vertices are removed.
2. Apply [^P1], [^P2], [^P3] until all interior Pauli vertices are removed or transformed into phase-gadgets
3. Remove all Clifford phase-gadgets using [^LC], [^P1].
4. Apply [^IDGF] wherever possible. If found match, go to step 1 and repeat. Otherwise, done.
"""

# ╔═╡ 50f18c98-a904-4dd3-8311-1c3258e4c833
function generate_example2()
    cir = ZXDiagram(5)
    push_gate!(cir, Val(:X), 5, 1//1)
    push_gate!(cir, Val(:H), 5)
    push_gate!(cir, Val(:Z), 5)
    push_gate!(cir, Val(:CNOT), 5, 4)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 1)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:CNOT), 5, 4)
    push_gate!(cir, Val(:Z), 4, 1//4)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 1)
    push_gate!(cir, Val(:CNOT), 4, 1)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:Z), 1, 1//4)
    push_gate!(cir, Val(:Z), 4, 7//4)
    push_gate!(cir, Val(:CNOT), 4, 1)
    push_gate!(cir, Val(:CNOT), 5, 4)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 3)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:CNOT), 5, 4)
    push_gate!(cir, Val(:Z), 4, 1//4)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 3)
    push_gate!(cir, Val(:CNOT), 4, 3)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:Z), 3, 1//4)
    push_gate!(cir, Val(:Z), 4, 7//4)
    push_gate!(cir, Val(:H), 5)
    push_gate!(cir, Val(:Z), 5)
    push_gate!(cir, Val(:CNOT), 4, 3)
    push_gate!(cir, Val(:CNOT), 5, 4)
    push_gate!(cir, Val(:H), 5)
    push_gate!(cir, Val(:Z), 5)
    push_gate!(cir, Val(:CNOT), 5, 3)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 2)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:CNOT), 5, 3)
    push_gate!(cir, Val(:Z), 3, 1//4)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 2)
    push_gate!(cir, Val(:CNOT), 3, 2)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:H), 5)
    push_gate!(cir, Val(:Z), 2, 1//4)
    push_gate!(cir, Val(:Z), 3, 7//4)
    push_gate!(cir, Val(:Z), 5)
    push_gate!(cir, Val(:CNOT), 3, 2)
    push_gate!(cir, Val(:CNOT), 5, 3)
    push_gate!(cir, Val(:H), 5)
    push_gate!(cir, Val(:Z), 5)
    push_gate!(cir, Val(:CNOT), 5, 2)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 1)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:CNOT), 5, 2)
    push_gate!(cir, Val(:Z), 2, 1//4)
    push_gate!(cir, Val(:Z), 5, 7//4)
    push_gate!(cir, Val(:CNOT), 5, 1)
    push_gate!(cir, Val(:CNOT), 2, 1)
    push_gate!(cir, Val(:Z), 5, 1//4)
    push_gate!(cir, Val(:Z), 1, 1//4)
    push_gate!(cir, Val(:Z), 2, 7//4)
    push_gate!(cir, Val(:H), 5)
    push_gate!(cir, Val(:Z), 5)
    push_gate!(cir, Val(:CNOT), 2, 1)
    push_gate!(cir, Val(:CNOT), 5, 2)
    push_gate!(cir, Val(:CNOT), 5, 1)
    return cir
end


# ╔═╡ 4cdea696-e04b-46f2-8851-e1aeaab1a59a
zxd = generate_example2();

# ╔═╡ 96681a44-4d37-400f-9a15-464f3cb6b699
md"""
$(RobustLocalResource(urlintro, pathex2,:width=>800, :align=>:center, :alt=>"Ex2 Circuit", cache=false))
"""

# ╔═╡ 64243e63-fa53-40c5-99ac-efd60a4065c3
zxd_reduced = phase_teleportation(zxd);

# ╔═╡ 361176b7-b196-446f-b1ef-61b352c3d216
@benchmark phase_teleportation(zxd)

# ╔═╡ ba0fea9f-00a0-4013-bdd4-70c9fd38d96a
md"""##### Result
Reduced number of T gates from $(tcount(zxd)) to $(tcount(zxd_reduced)).
"""

# ╔═╡ 02390a36-06fe-4fb7-b00f-46461542a8aa
md"""# ZXW-Calculus: A Dialect
- **Triangle**: $(RobustLocalResource(urlintro, pathytrig,:width=>100, :align=>:center, :alt=>"W Spider", cache=false))
- **W Spider**:  $(RobustLocalResource(urlintro, pathbtrig,:width=>400, :align=>:center, :alt=>"W Spider", cache=false))
- **Syntax Sugar**: $(RobustLocalResource(urlintro, pathbtrig_sug,:width=>100, :align=>:center, :alt=>"W Spider", cache=false))
"""

# ╔═╡ 2ba578c3-1ae0-45f7-aec8-445fabf7a911
md"""## Rewrite Rules
- $\frac{\partial (f(x)g(x)h(x))}{\partial x} = \frac{\partial f(x)}{\partial x}g(x)h(x) + \frac{\partial g(x)}{\partial x}f(x)h(x) + \frac{\partial h(x)}{\partial x}f(x)g(x)$
- **Addition of Linear Maps**: $(RobustLocalResource(urlintro, pathzxw_add,:width=>400, :align=>:center, :alt=>"W Spider", cache=false))
- **Rule to differentiate**: $(RobustLocalResource(urlintro, pathdiff_rule,:width=>400, :align=>:center, :alt=>"W Spider", cache=false))
- **Rule to integrate**: $(RobustLocalResource(urlintro, pathint_rule,:width=>400, :align=>:center, :alt=>"W Spider", cache=false))
"""

# ╔═╡ 2b818577-8ba6-4939-b6ff-2572b169ab63
md"""## Application: Barren Plateau Detection
- **Circuit Ansatz**: Parameterized Circuit
- **Barren Plateau**: "the training landscape of many circuit ansätze have been shown to be exponentially flat with respect to circuit size, making gradient descent impossible" [^DiffInt]
- **Expectation value**: $\langle H \rangle = \langle 0 | U^{\dagger}(\vec{\theta}) H U(\vec{\theta}) |0\rangle$
- **Variance of Expectation value**: 
```math
\mathbf{Var}\left(\frac{ \partial \braket{H}}{\partial\theta_j}\right)
= \mathbf{E}\left(\left(\frac{ \partial \braket{H}}{\partial\theta_j}\right)^2\right) \\
= \frac{1}{(2\pi)^m}\int_{-\pi}^{\pi} \cdots\int_{-\pi}^{\pi}  \left(\frac{ \partial \braket{H}}{\partial\theta_j}\right)^2d\theta_1\cdots d\theta_m, j=1, \cdots, m.
```
"""

# ╔═╡ bc3a6b2f-31ce-46d7-8840-908c2b9c5558
begin
	zxwd = ZXWDiagram(2)

    push_gate!(zxwd, Val(:H), 1)
    push_gate!(zxwd, Val(:H), 2)
    push_gate!(zxwd, Val(:CZ), 1, 2)
    push_gate!(zxwd, Val(:X), 1, :a; autoconvert = false)
    push_gate!(zxwd, Val(:X), 2, :b; autoconvert = false)
	vizcircuit(zxwd;fontsize=15,bgcolor="white",linewidth=5,circsize=18,vrot=0.0,graphwidth=15,graphheight=10)
end

# ╔═╡ b4fb8daa-4906-4b2f-9951-0a629f03478b
begin
	    exp_zxwd = expval_circ!(zxwd, "ZZ")
		vizcircuit(exp_zxwd;fontsize=5,bgcolor="white",linewidth=5,circsize=10,vrot=0.0,graphwidth=20,graphheight=8)
end

# ╔═╡ ece7daa1-e3fc-4b15-80ce-46a4b9049757
begin
	matches = match(CalcRule(:diff, :b), exp_zxwd)
    diff_exp = rewrite!(CalcRule(:diff, :b), exp_zxwd, matches)
    matches = match(CalcRule(:diff, :a), diff_exp)
    diff_exp = rewrite!(CalcRule(:diff, :a), diff_exp, matches)
    dbdiff_zxwd = stack_zxwd!(diff_exp, copy(diff_exp))

    matches = match(CalcRule(:int, :b), dbdiff_zxwd)
    int_dbdiff = rewrite!(CalcRule(:int, :b), dbdiff_zxwd, matches)
    matches = match(CalcRule(:int, :a), int_dbdiff)
    int_dadiff = rewrite!(CalcRule(:int, :a), copy(int_dbdiff), matches)
    int_vala = real(Matrix(int_dadiff)[1, 1])
	    
	A = real(Matrix(substitute_variables!(copy(int_dbdiff), Dict(:a => 0.0)))[1, 1])
end


# ╔═╡ d516b5ed-69f9-41d7-8627-7df14a740e7c
md"""# Summary & Credits
- Authors of ZXCalculus.jl: 
|Dr. [Chen Zhao](https://github.com/ChenZhao44) |[Xiu-zhe (Roger) Luo](https://github.com/Roger-luo)|
|--------------|------------------|
|$(RobustLocalResource(urlcz, pathcz,:width=>200, :alt=>"Dr. Chen Zhao", cache=false))|$(RobustLocalResource(urlrl, pathrl, :width=>200, :alt=>"Xiuzhe (Roger) Luo", cache=false))|
- Dr. Chen Zhao mentored me during the OSPP project
- _Thank you for your attention_!
"""

# ╔═╡ 3b6c88e7-6d8a-46a8-a3fb-b396c611aa09


# ╔═╡ a0fad932-7a89-472a-9c50-24dc771543bc
md"""## Rules
[^LC]: 
$(RobustLocalResource(urlcz, pathlc,:width=>500, :alt=>"LC rule", cache=false))
[^P1]:
$(RobustLocalResource(urlcz, pathp1,:width=>500, :alt=>"P1", cache=false))
[^P2]: 
$(RobustLocalResource(urlcz, pathp2,:width=>500, :alt=>"P2", cache=false))
[^P3]: 
$(RobustLocalResource(urlcz, pathp3,:width=>500, :alt=>"P3", cache=false))
[^IDGF]: 
$(RobustLocalResource(urlcz, pathidgf,:width=>500, :alt=>"idgf", cache=false))
"""

# ╔═╡ 10af6d43-453e-46e0-b983-eb00c53e8a68
md"""
[^ZXWorking]: van de Wetering, John. "ZX-calculus for the working quantum computer scientist." arXiv preprint arXiv:2012.13966 (2020).
[^LMUniv]: Coecke, Bob, and Ross Duncan. "Interacting quantum observables: categorical algebra and diagrammatics." New Journal of Physics 13.4 (2011): 043016.
[^CircExtra]: Coecke, Bob, and Ross Duncan. "Interacting quantum observables: categorical algebra and diagrammatics." New Journal of Physics 13.4 (2011): 043016.
[^PhaseTele]: Kissinger, Aleks and John van de Wetering. “Reducing T-count with the ZX-calculus.” (2019).
[^TheBible]: Nielsen, Michael A., and Isaac L. Chuang. Quantum Computation and Quantum Information: 10th Anniversary Edition. Cambridge: Cambridge UP, 2010. Print.
[^EKThm]: Eastin, Bryan and Emanuel Knill. “Restrictions on transversal encoded quantum gate sets.” Physical review letters 102 11 (2008): 110502 .
[^MagicCosts]: Campbell, Earl T. et al. “Roads towards fault-tolerant universal quantum computation.” Nature 549 (2016): 172-179.
[^DiffInt]: Wang, Quanlong and Richie Yeung. “Differentiating and Integrating ZX Diagrams.” ArXiv abs/2201.13250 (2022): n. pag.
[^BarrenPlateau]:Zhao, Chen and Xiao-Shan Gao. “Analyzing the barren plateau phenomenon in training quantum neural network with the ZX-calculus.” Quantum 5 (2021): 466.
[^StackExchange]: https://quantumcomputing.stackexchange.com/a/28058/5116
[^EKWiki]: https://en.wikipedia.org/wiki/Eastin%E2%80%93Knill_theorem
[^fn1]: https://en.wikipedia.org/wiki/Calculus
[^fn2]: Oxford Languages
"""

# ╔═╡ d9b84bdc-bec6-4c0a-b33a-fa62334c841f
md"""## Scalars
$(RobustLocalResource(urltp, pathscalars,:width=>500, :align=>:center, :alt=>"Translation table", cache=false))
"""

# ╔═╡ 6bbf81a9-1fa8-4b83-8663-307ed886446a
md"""## Soundness
- **Definition of Soundness**: "A rewrite rule is sound when it preserves the underlying semantics."[^ZXWorking]
- **Semantics in ZX-Calculus**: Representation of Linear Maps Demonstrating Soundness through ZXCalculus.jl:
- **Example**: Fusion Rule $(RobustLocalResource(urlintro, pathfusion,:width=>300, :align=>:center, :alt=>"Translation table", cache=false))
- Code Demonstration in ZXCalculus.jl
"""

# ╔═╡ fd895c02-71f1-45f4-a7c9-cd0df0af4776
md"""## Triangle and W Spider
- W spider: W state, preparable by quantum circuit, expressible by ZX
- Check out: Hadzihasanovic, Amar et al. “Two complete axiomatisations of pure-state qubit quantum computing.” Proceedings of the 33rd Annual ACM/IEEE Symposium on Logic in Computer Science (2018): n. pag.

"""

# ╔═╡ Cell order:
# ╠═5b60b904-918c-11ee-2d1b-c382c891cbb8
# ╟─0f6ad1ea-39b2-4197-8f00-5afa55839be2
# ╟─fe1cc35d-4372-404d-bacb-bf96e7423e23
# ╟─7636ca8e-04a8-443a-a7f6-e7fbd70ebce6
# ╟─166384c5-b083-4792-a397-2f9495a3bc7b
# ╟─87538743-fed0-4db1-bc6b-a2f76b68cd5a
# ╟─6330319d-9425-4619-95cc-7f5bd7eca9bf
# ╟─b202bd88-2cb7-4a61-b0e1-58fe28f86694
# ╠═706f074a-95ea-4d3a-8ef6-b355f1723a01
# ╟─8070ba67-191f-4a1b-bda2-e7c51da8b875
# ╟─578abf2a-7689-4ca6-97ce-f46e6d09c2f3
# ╟─07d1c636-d75d-4cf9-bd6f-6ff7ad3c71f9
# ╠═70f24e1d-e9b9-469d-bdfe-5ac58c2cc3b3
# ╟─7eb910f9-a0d0-4e6b-9d06-b8af4e3b8e81
# ╟─5a460cd4-3339-47e2-99ed-551cd2c6ef8d
# ╟─ca74bef6-1c75-4d55-8b84-e309a9fecf2a
# ╟─11f63c7e-f648-4f1d-b09d-3ec15a613174
# ╟─3213c733-672a-4eca-9381-1a690d666eed
# ╟─3967f9c9-5f72-4406-83f0-7cd0cd9648ce
# ╠═51b2c6b7-78f4-401e-899b-dab3bd8a4208
# ╠═0d78bec4-e737-4eef-aa9a-b0d2bb50c309
# ╠═bfdf1671-d300-44db-8d2b-9e5fe5cdbed3
# ╠═548182df-6533-4d84-8373-8e0678c3cf82
# ╠═019de6e9-c36a-4c37-86f8-6a5d4f03ebdc
# ╠═c3dd649b-d3d7-4676-a9e2-56b633f2c2f4
# ╠═c7fe41a9-4b2d-4de4-8657-f6d1a831cfc2
# ╠═b5a6723a-5be3-47fa-80b0-7b6da34f810d
# ╠═90cf6abb-3667-4a16-9683-c9f6f294bddc
# ╠═e1664a56-1f86-4a6b-8458-f3821cd6129b
# ╠═af65fcc7-dfcf-4eaf-8625-fea8646d887d
# ╟─6efeb0f0-17a4-4597-b4de-0ec886f0104d
# ╟─94e38c96-70fe-4033-ab0a-1ab4a65161cd
# ╠═c07c5b84-7bc6-40a2-ad65-9647a6280ffd
# ╟─50f18c98-a904-4dd3-8311-1c3258e4c833
# ╠═4cdea696-e04b-46f2-8851-e1aeaab1a59a
# ╟─96681a44-4d37-400f-9a15-464f3cb6b699
# ╠═64243e63-fa53-40c5-99ac-efd60a4065c3
# ╠═361176b7-b196-446f-b1ef-61b352c3d216
# ╠═ba0fea9f-00a0-4013-bdd4-70c9fd38d96a
# ╟─02390a36-06fe-4fb7-b00f-46461542a8aa
# ╟─2ba578c3-1ae0-45f7-aec8-445fabf7a911
# ╟─2b818577-8ba6-4939-b6ff-2572b169ab63
# ╠═bc3a6b2f-31ce-46d7-8840-908c2b9c5558
# ╟─c971cff3-13b9-45a0-b954-533ebef04c81
# ╠═b4fb8daa-4906-4b2f-9951-0a629f03478b
# ╠═ece7daa1-e3fc-4b15-80ce-46a4b9049757
# ╟─d516b5ed-69f9-41d7-8627-7df14a740e7c
# ╟─3b6c88e7-6d8a-46a8-a3fb-b396c611aa09
# ╟─a0fad932-7a89-472a-9c50-24dc771543bc
# ╠═10af6d43-453e-46e0-b983-eb00c53e8a68
# ╟─d9b84bdc-bec6-4c0a-b33a-fa62334c841f
# ╟─6bbf81a9-1fa8-4b83-8663-307ed886446a
# ╠═fd895c02-71f1-45f4-a7c9-cd0df0af4776
