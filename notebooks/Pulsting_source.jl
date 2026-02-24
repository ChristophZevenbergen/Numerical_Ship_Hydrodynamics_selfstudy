### A Pluto.jl notebook ###
# v0.20.22

using Markdown
using InteractiveUtils

# ╔═╡ 70405296-1194-11f1-9405-d9767047a758
md"""
# Translating, Pulsating Source

This code avaliates the Green's Function for a translating, pulsating source, accounting for the free surface boundary condition.


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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.5"
manifest_format = "2.0"
project_hash = "71853c6197a6a7f222db0f1978c7cb232b87c5ee"

[deps]
"""

# ╔═╡ Cell order:
# ╟─70405296-1194-11f1-9405-d9767047a758
# ╟─9025848e-6135-4f4f-bbc1-454471b6b9ca
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
