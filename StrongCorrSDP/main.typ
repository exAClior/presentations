#import "@preview/touying:0.5.5": *
#import "@preview/physica:0.9.4": *
#import themes.metropolis: *

#import "@preview/numbly:0.1.0": numbly

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Strongly Correlated System],
    subtitle: [Solving with SDP],
    author: [Yusheng Zhao],
    date: datetime.today(),
    institution: [HKUST(GZ)],
    logo: none 
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#slide(title: "Hamiltonian")[
$
	  H = sum_(p,q) sum_(sigma) (T_(p q) + V_(p q)) hat(a)_(p sigma)^(dagger) hat(a)_(q sigma) +  1/2 sum_(p,q,r,s) sum_(sigma, tau) (p r | q s) hat(a)_(p sigma)^(dagger) hat(a)_(q tau)^(dagger) hat(a)_(s tau) hat(a)_(r sigma)
$
where
- $p,q,r,s$ are spatial components of orbitals
- $sigma, tau$ are spin components of orbitals
- $
		T_(p q) = integral d bold(r) phi_p^*(bold(r)) [- (hbar^2 grad^2)/(2m)] phi_q(bold(r)) 
	$ where $phi_p(bold(r))$ is spatial orbital indexed by $p$.
- $V$ correspond to potential energy term.
- $
	 (p r | q s) = integral d bold(r) d bold(r)' phi_p^*(bold(r)) phi_r^*(bold(r)') V(bold(r)-bold(r)') phi_q (bold(r)) phi_s (bold(r)') 
	$
]

#slide(title: "SDP Variables")[
  $ket(psi)$ is the ground state of $H$, $attach(tl:k,br: q ...,tr:p ...., D)$ are different type of Reduced Density Matrices (RDM) 
  
  #table(
    columns: (auto, auto, auto),
    stroke: 1pt,
    inset: 18pt,
    align: (center + horizon, center + horizon, center + horizon),
    [*$hat(C)_I^dagger$*], [*Variable type*], [*Variable definition*],
    [$hat(a)_(q sigma)$], [one-electron], [$attach(tl:1,br:q sigma, tr:p sigma,D) = braket(psi , hat(a)_(p sigma)^dagger hat(a)_(q sigma) , psi) in bb(C)^(#text(red)[$n_p times n_q$])$],
    [$hat(a)_(q sigma)^dagger$], [one-hole], [$attach(tl:1,br:q sigma, tr:p sigma,Q) = braket(psi , hat(a)_(p sigma) hat(a)_(q sigma)^dagger , psi)$],
    [$hat(a)_(s tau) hat(a)_(r sigma)$], [two-electron], [$attach(tl:2,br:r sigma s tau, tr:p sigma q tau,D) = braket(psi , hat(a)_(p sigma)^dagger hat(a)_(q tau)^dagger hat(a)_(s tau) hat(a)_(r sigma) , psi)$],
    [$hat(a)_(s tau)^dagger hat(a)_(r sigma)^dagger$], [two-hole], [$attach(tl:2,br:r sigma s tau, tr:p sigma q tau,Q) = braket(psi , hat(a)_(p sigma) hat(a)_(q tau) hat(a)_(s tau)^dagger hat(a)_(r sigma)^dagger , psi)$],
    [$hat(a)_(s lambda) hat(a)_(r kappa)$], [electron-hole], [$attach(tl:2,br:r kappa s lambda, tr:p sigma q tau,G) = braket(psi , hat(a)_(p sigma)^dagger hat(a)_(q tau) hat(a)_(s lambda)^dagger hat(a)_(r kappa) , psi)$)],
  )
]

#slide(title: "SDP Constraints")[
	- Commutation relation: $a_(p sigma) a_(q tau) = - a_(q tau) a_(p sigma) arrow.r.double attach(tl:2,br:r sigma s tau, tr:p sigma q tau,D) = - attach(tl:2,br:r sigma s tau, tr:q tau p sigma,D)$
	- Good quantum number: $[hat(H),hat(S)^2] = [hat(H),hat(S)_z] = 0 arrow.r.double  sum_(r) attach(tl:2,br: q tau r sigma, tr:p tau r sigma, D) = (N_sigma - delta_(sigma tau)) attach(tl:1,br:q tau, tr: p tau, D)$
	- $3$ RDM improves accuracy
	- No scaling and guarantee of convergence
] 

#slide(title: "Solvers")[
	- Interior point method on $r$ number of one-electron basis function @mazziotti2004Realization:
		1. Memory: $cal(O)(r^8)$
		2. Floating-point operation: $cal(O)(r^16)$
	- Augmented Lagrangian method improves @iii2023Variational
		1. Memory: $cal(O)(r^4)$
		2. Floating-points: $cal(O)(r^6)$
	- What is current best?
]

#slide(title: "Performance")[
	- 64 electrons distributed in 64 orbitals for 3,7-circumacene molecules @mullinax2019Heterogeneous
	- Convergence Criteria in Hartree Energy $approx 27.2114 e V$
		1. Orbital Gradient: $epsilon_("ograd") < 1.0 times 10^(-6) E_h$
		2. Energy Change $epsilon_("oene") <= 1.0 times 10^(-9) E_h$
	- Do we already know best value from other methods?
]

#slide(title: "Limitations")[
	- Fractional Charge
	- Nonesrelativistic Hamiltonian 
	- Pure-State N-representability
]

#bibliography("ref.bib",style:"springer-basic-author-date")