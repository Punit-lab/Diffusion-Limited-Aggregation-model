## 1.1 Diffusion-Limited-Aggregation-model
Diffusion Limited Aggregation (DLA) is a fascinating process where particles, driven by Brownian motion, come together to form clusters. This theory, pioneered by T.A. Witten Jr. and L.M. Sander in 1981, is a fundamental concept in systems where diffusion is the primary mode of transport.

The formation of large clusters from basic subunits is a common occurrence in nature, seen in phenomena like tumor growth, smoke particle coagulation, and early stages of nucleation. Unlike equilibrium processes, where clusters can rearrange, these kinetic aggregation processes often result in fractal geometry.

Fractal geometry, introduced by B. Mandelbrot, has been instrumental in understanding complex objects that defy simple description. These objects can be characterized by a few parameters, with the volume having a power-law relation with the linear size of the object, represented as V(r) ~ rd, where d is the Hausdorff or fractal dimension, which is usually not a simple integer.

Fractal aggregates bear a resemblance to equilibrium systems near a critical point. Witten and Sander's kinetic model of diffusion-limited aggregation has been instrumental in understanding the structure of these aggregates. Forrest and Witten's study on the condensation of smoke particles further revealed that the resulting aggregates exhibit long-range particle density correlation and self-similarity, making them fractals in the statistical sense.
## 1.2 Computer simulation of Diffusion limited Aggregation Model 
 Computer simulations of DLA are primary for studying the DLA model.They can be done on a lattice or along the lines of a standard molecular dynamics simulation. Very important is the fact that the number of particles undergoing Brownian motion is kept very low so the aggregation is only controlled by diffusion.
 The simplest computer growth using a lattice starts with an initial seed particle at some origin and another particle placed somewhere in the lattice.Then the second particle walks randomly from lattice site to lattice site. It meets the first particle and becomes part of the aggregate or it moves out from the lattice and another particle is introduced. 
 In the first case that the particle becomes part of the aggregate, another particle is placed on the lattice and walks randomly until it meets the two first particles and becomes part of the aggregate or it moves out from the lattice and a new particle is introduced. This action goes on as long as particles are available.
### There are variations within DLA simulation models:
- We can introduce a sticking coefficient which will not always allow the particle that reaches the cluster to stick to it. Also different attaching probabilitie can be used.

- There are variations on lattice geometries : a square lattice with four neighbour sites or a triangular lattice with six neighbour sites. The shape of the whole cluster depends on the shape of the lattice.
- If someone wants to create very large clusters, they can not use any lattice at all. Instead of a starting seed point, there can be used a starting line.
#### Introduction to model:
In order to simulat DLA process,I have used a 2D square lattice. simulation start with initial seed  at the center of the lattice. then another particle at a certain distance from the seed particle Rstart. these  new particle undergrow brownian motion in 2D Lattice. If the new particle meets the seed particle it becomes part of the aggrrgate. If it goes far from the initial seed (Rstop),then particle can be  removed and a new particle is introduced at random position. these  new particle is will follow the same process till meet the seed particle and procedure is repeated for many particles.


1. Initialize : We start with a seed particle in the center of an empty square lattice.We set the cluster mass **M = 1** and the cluster radius **Rmax = 1**.
2. Place a new particle : Place a single particle with equal probability on a circle with radius **Rstart > R(max)** about the center. We set **Rstart = Rmax + 5**.
3. Diffusion : Move the particle from its current position to a randomly chosen nearest neighbour site. We repeat this step until a nearest neighbour site of a cluster particle is reached and then we move to step.
4. Aggregation : Add the particle to the cluster, increase M by one and re-evaluate Rmax. We stop when the desired mass M is reached, else we go to step 2.
- Particles can drift arbitrarily far away from the cluster. In that case we must replace step 3 with the following procedure: We calculate the current distance r of the particle from the origin and if **r≥ Rstop** we remove the particle from the lattice and we go to step 2. We repeat step 3 until a nearest neighbour of a cluster site is reached and then we move to step 4.
- The boundary sphere with radius Rstop , Rstart, is necessary in order to avoid particle’s roaming far from the aggregate since this will increase computational time. The radius Rstart and Rstop are not fixed and are continuously optim
ed. We have set **Rstart = Rmax + 5** and **Rstop = 1.5 × Rstart**

#### ** To get complete overview of programe go to diffusion.f90 file .** 

After the running programe and storing file with co ordinate give plot ,you get beutifull image.

! ![fractal1 0](https://user-images.githubusercontent.com/69799907/147125744-ed4cef1e-f1e1-4bec-b255-752113f678dd.png)

   
   
program
