# 1.1 Diffusion-Limited-Aggregation-model
###          Diffusion Limited Aggregation (DLA) is a process in which particles undergoing a random walk due to Brownian motion, cluster together to form aggregates of such particles.This theory was proposed in 1981 by T.A. Witten Jr. and L.M. Sander and it is used to any system in which the main means of transport is diffusion.
####      The irreversible formation of large clusters from basic subunits is seen often in nature,such as the growth of tumors, coagulation of smoke particles,the early stages of nucleation, electric deposition of ions onto an electrode.These clusters are different from equilibrium irreversible kinetic processes in which the basic units of clusters, after they have joined the clusters, are notable to rearrange themselves.These kinetic aggregation processes were known to result in fractal geometry
#####          This concept of fractal geometry was introduced by B. Mandelbrot in order to study the geometrical properties of complex objects. He found that these objects, that could not previously be described by simple means,can be characterized by a few parameters. The volume V (r) has a power-law relations with the linear size of the object : V (r) ' r d where d is the Hausdorff dimension or fractal dimension and is generally not a simple integer.The structure of fractal aggregates looks like that of equilibrium systems near a critical point. Witten and Sander proposed a simple kinetic model of diffusion limited aggregation, helping understand the structure of the aggregates or the clusters formed by irreversible growth processes. Forrest and Witten studied the condensation of smoke particles of iron, zinc and silicon dioxide and found that the particle density correlation of the resulting aggregates can be long-ranged. They also discovered that the aggregates are self-similar in the statistical sense so they are fractals.
## 1.2 Computer simulation of Diffusion limited Aggregation Model 
#### Computer simulations of DLA are primary for studying the DLA model.They can be done on a lattice or along the lines of a standard molecular dynamics simulation. Very important is the fact that the number of particles undergoing Brownian motion is kept very low so the aggregation is only controlled by diffusion.
#### The simplest computer growth using a lattice starts with an initial seed particle at some origin and another particle placed somewhere in the lattice.Then the second particle walks randomly from lattice site to lattice site. It meets the first particle and becomes part of the aggregate or it moves out from the lattice and another particle is introduced. 
#### In the first case that the particle becomes part of the aggregate, another particle is placed on the lattice and walks randomly until it meets the two first particles and becomes part of the aggregate or it moves out from the lattice and a new particle is introduced. This action goes on as long as particles are available.
### There are variations within DLA simulation models:
- We can introduce a sticking coefficient which will not always allow the particle that reaches the cluster to stick to it. Also different attaching probabilitie can be used.

- There are variations on lattice geometries : a square lattice with four neighbour sites or a triangular lattice with six neighbour sites. The shape of the whole cluster depends on the shape of the lattice.
- If someone wants to create very large clusters, they can not use any lattice at all. Instead of a starting seed point, there can be used a starting line.
