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
#### In order to create our DLA model we used a square lattice which is the two-dimensional version of the integer lattice. Our initial seed is a particle at the center of the lattice. We placed another particle at a certain distance from the seed particle Rstart. Then we moved the new particle around in random motion (up,down,left,right), step by step from lattice site to lattice site. If the new particle meets the first particle it becomes part of the aggrrgate. If it goes far from the initial seed (Rstop), we remove it and a new particle is introduced. Then a new particle is thrown onto the lattice at Rstart, it walks around and after a while meets the first two or moves out from the lattice and this procedure is repeated as long as particles are available.


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
