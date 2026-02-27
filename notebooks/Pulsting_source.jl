### A Pluto.jl notebook ###
# v0.20.21

using Markdown
using InteractiveUtils

# ╔═╡ 70405296-1194-11f1-9405-d9767047a758
md"""
# Translating, Pulsating Source

This code avaliates the Green's Function for a translating, pulsating source, accounting for the free surface boundary condition. This problem was already solved analyticly by Wehausen and Laitone in 1960. Unfortuanly computing this equation is quite difficult and some simplifications (rearrengements) were proposed throughout the years.

The work of [Du et al. (2000)](http://dx.doi.org/10.1243/0954406001522903) has sucessfuly applied the source therm to a ship hydrodynamics case. It gives a nice overview of the original equation as follows:
"""

# ╔═╡ 0a404508-191f-4dab-91da-5deab000a898
md"""
---

### Wehausen and Laitone Green's function

*Let us definne a right-handed equilibrium axis system $Oxyz$ such that the origin $O$ is in the plane of the calm water surface vertically above the centre of gravity of the vessel. The $z$ axis is positive upwards and the $x$ and $y$ axes lie in the plane of the undisturbed free surface. The axis system translates with constant velocity $\bar{U}$ positive $x$ direction.*
 
*The Green's function at field point $(x; y; z)$ is denoted as the velocity potential*

$G( x, y, z; x_0 , y_0 , z_0)e^{i\omega t}$

*of a translating, pulsating source at $(x_0, y_0, z_0 )$. The velocity potential $\phi$ satisfies the Laplace equation throughout the fluid domain, the linearized free-surface condition*

$\left(\mathrm{i} \omega-\bar{U} \frac{\partial}{\partial x}\right)^2 \phi+g \frac{\partial \phi}{\partial z}=0 \quad  \text{on } z=0$

*and the usual radiation condition ensuring outgoing waves at infinity*

*The form of the speed dependent velocity potential satisfying these conditions for water of infinite depth is given by Wehausen and Laitone [17] as*

$\begin{aligned} & G\left(x, y, z ; x_0, y_0, z_0\right)=\frac{1}{R_1}-\frac{1}{R_2}+\frac{2 g}{\pi} \\ & \quad \times\left(\int_0^\gamma \int_0^{\infty}+\int_\gamma^{\pi / 2} \int_{L_1}+\int_{\pi / 2}^\pi \int_{L_2}\right) f(\theta, k) \mathrm{d} k \mathrm{~d} \theta \quad (2) \\ & \quad \quad [...]\end{aligned}$

*As it stands, the Green's function in equation (2) is troublesome to evaluate numerically, as there are two singular points in the second integral (i.e. $k = k_1$ and $k = k_2$) and two in the third (i.e. $k = k_3$ and $k = k_4$).* [...]


*The velocity potential given by equation (2) is discussed in the literature (see, for example, references [18] and [25]). The nature of the function changes when $\beta = 1/4$, at which point terms in the function become infinite and a solution unobtainable. In addition, as $\omega \rightarrow$ the potential, $G$, approaches that of the Kelvin wavemaking potential for steady motion [26], and as $\bar{U} \rightarrow 0$ it approaches the fundamental zero-speed frequency dependent potential of a pulsating source, with waves radiating in all directions. Indeed, it can be shown that for $\beta < 1/4$ there are four wave trains associated with the singularities $k_1$, $k_2$, $k_3$ and $k_4$, three being behind the source and one in advance; i.e. the group velocity is greater than the speed of advance. When
$\beta > 1/4$ the upstream wave train disappears.*

---

"""

# ╔═╡ eb4a0f96-b7d7-40ef-91d2-45629d9af7bb
md""" 
From this, we have some very interesting observations over the Green's function. First, since it is an translating (velocity $\bar{U}$) and ocilating (frequency $\omega$) source, if any of those is zero we recover or the purely tranlating source or the purely ocilating source. Both we know how to compute, unfortuanly, the combination of both together results in a double integrals with singularities (i.e. divided by zero), very dificult to compute!

Furhtermore, there is a term $\beta$ that, as discussed by the author, has very strong importance for the behavior of the generated waves, it is given by:

$\beta = \frac{\bar{U} \omega}{g}$

This term dictates the behavior of our function, whe
"""

# ╔═╡ 1584554f-cdfd-4a88-87b7-0f363a83ad99
md"""
---
### Bessho simplification

In order to compute the Green's function, some rearrengements, of the equation were proposed, in this module we will analyse the one proposed by [Bessho (1977)](https://www.nda.ac.jp/cc/users/kqnaoe/Bessho/suiha/chap_1/1-23.pdf).

The Greens's function becomes:

"""

# ╔═╡ 9025848e-6135-4f4f-bbc1-454471b6b9ca
md"""

$G(x, y, z; x_0, y_0, z_0) = \frac{1}{4\pi} \left ( \frac{1}{R_1} - \frac{1}{R_2} \right ) - \frac{i}{2\pi} K_0 T(X, Y, Z)$

 $R_1$ is the distance to the sorce and $R_2$ is the distance to the sink reflected above the free surface.

$R_1=\sqrt{\left(x-x_0\right)^2+\left(y-y_0\right)^2+\left(z-z_0\right)^2}$

$R_2=\sqrt{\left(x-x_0\right)^2+\left(y-y_0\right)^2+\left(z+z_0\right)^2}$

$T(X, Y, Z)=\int_{\alpha-\pi}^{\pi / 2+\psi-\mathrm{i} \epsilon} \frac{\begin{array}{c}{\left[k_2 \exp \left(k_2 w\right)-\right.} \left.\operatorname{sgn}(\cos \theta) k_1 \exp \left(k_1 w\right)\right] \mathrm{d} \theta\end{array}}{\sqrt{1+4 \beta \cos \theta}}$

$k_1=\frac{1}{2 \cos ^2 \theta}(1+2 \beta \cos \theta+\sqrt{1+4 \beta \cos \theta})$

$k_2=\frac{1}{2 \cos ^2 \theta}(1+2 \beta \cos \theta-\sqrt{1+4 \beta \cos \theta})$

$\psi=\cos ^{-1} \frac{X}{\sqrt{X^2+Y^2}}, \quad \epsilon=\sinh ^{-1} \frac{|Z|}{\sqrt{X^2+Y^2}}$

$\alpha= \begin{cases}\cos ^{-1}\left(\frac{1}{4 \beta}\right) & \text { if } \beta \geqslant \frac{1}{4} \\ -\mathrm{i} \cosh ^{-1}\left(\frac{1}{4 \beta}\right) & \text { if } \beta<\frac{1}{4}\end{cases}$

$w=Z+\mathrm{i}(X \cos \theta+Y \sin \theta)$

$\beta=\frac{\bar{U} \omega}{g}, \quad K_0=\frac{g}{\bar{U}^2}$

$X=K_0\left(x-x_0\right), \quad Y=K_0\left|y-y_0\right|, \quad Z=K_0\left(z+z_0\right)$
"""

# ╔═╡ 32078ab3-7e7f-4914-9c97-719f215c3689
begin
g = 9.81
U = 1
ω = 1
x₀ = 0
y₀ = 0
z₀ = -1
x = -1
y = 0
z = -1

K₀ = g/U^2
β = U*ω/g
X = K₀*(x - x₀)
Y = K₀*abs(y - y₀)
Z = K₀*(z + z₀)

end

# ╔═╡ f8c6cda0-9b22-4664-b147-90acd1ff54c7
begin


	
w(θ) = Z + i(X*cos(θ) + Y*sin(θ))
k₁(θ) = (1/(2*cos^2(θ)))*(1+2β*cos(θ) + sqrt(1 + 4β*cos(θ)))
k₂(θ) = (1/(2*cos^2(θ)))*(1+2β*cos(θ) - sqrt(1 + 4β*cos(θ)))

	
	
#Int(θ) = k₂(θ)*exp(k₂(θ)*w)-
end

# ╔═╡ 48cab0f5-42db-486f-a829-a23c3dfab3d2
md""" Hello World"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.4"
manifest_format = "2.0"
project_hash = "71853c6197a6a7f222db0f1978c7cb232b87c5ee"

[deps]
"""

# ╔═╡ Cell order:
# ╟─70405296-1194-11f1-9405-d9767047a758
# ╟─0a404508-191f-4dab-91da-5deab000a898
# ╟─eb4a0f96-b7d7-40ef-91d2-45629d9af7bb
# ╟─1584554f-cdfd-4a88-87b7-0f363a83ad99
# ╟─9025848e-6135-4f4f-bbc1-454471b6b9ca
# ╠═32078ab3-7e7f-4914-9c97-719f215c3689
# ╠═f8c6cda0-9b22-4664-b147-90acd1ff54c7
# ╠═48cab0f5-42db-486f-a829-a23c3dfab3d2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
