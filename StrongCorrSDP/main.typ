#import "@preview/touying:0.5.5": *
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
	Present Hamiltonian
]

#slide(title: "Variables")[
	Define RDMs, show definition etc
]

#slide(title: "Constraints")[
	List constraints

	Mention they are incomplete.
	What are the scaling like?
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