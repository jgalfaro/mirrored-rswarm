Risky Zone Avoidance Strategies for Drones [CCECE 2021]
===

### Michel Barbeau, Carleton University, School of Computer Science, Canada.

### Joaquin Garcia-Alfaro, Institut Polytechnique de Paris, Telecom SudParis, France.

### Evangelos Kranakis, Carleton University, School of Computer Science, Canada.

## Abstract

Supplementary Material to Ref. [1]. We consider the problem of a drone 
having to traverse a given terrain, such that traversing the terrain 
exposes the drone to certain risks (e.g., concentration of chemicals, 
severe thunderstorm wind gusts or any disturbing weather phenomena.) 
The goal of the drone is to navigate the terrain while minimizing the 
amount of risk. We develop a model for quantifying the exposure to a 
risk factor in a circular zone model. We propose two main strategies 
based on either rectilinear or curvilinear trajectories. We validate 
the work using numeric simulations. 

## Keywords

Drone, collision avoidance, obstacle avoidance, zone avoidance,
risk evaluation, risk mitigation.


## Introduction

We address the following problem. Consider a drone having to traverse
(fly over) a given terrain. While traversing the terrain, the drone is
exposed to a risk related to the geographical locations of a factor.
For example, a relative risk can be estimated as a function of the 2D
density of a population of individuals or as a function of 3D
concentration of chemicals or disturbing weather phenomena. The goal
of the drone is to navigate the terrain so as to find a path of
minimum risk.

We develop a metric for quantifying the exposure to a risk factor in a
circular zone model. We develop new zone avoidance strategies for
drones traversing terrains comprising several risky zones while
following either a rectilinear (i.e., straighline) trajectory or a
curvilinear (i.e., not straighline) trajectory

Figure 1 depicts the idea. It depicts a drone traversing a zone with a
rectilinear trajectory from A (entrance) to B (exit) at distance *h*
from the source point *p*. The shaded area represents the total amount
of exposure to risk by the drone.

<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/circle_segment_shaded.png" width="65%"  />

#### Figure 1. A drone is traversing a zone with a rectilinear trajectory from A (entrance) to B (exit) at distance h from the source point p. The shaded area represents the total amount of exposure to risk by the drone.

### Strategies For Curvilinear Trajectories

We focus on simulations and experimental results. We consider the
problem of how to navigate a domain while at the same time minimizing
the amount of risk that a flying drone is exposed to while flying a
curvilinear trajectory. We use and extend SwarmLab [2], a MATLAB
simulation environment for swarms of drones implementing existing
object collision algorithms, such as those by Olfati-Saber and Murray
[3] and Vasarhelyi et al. [4].

The SwarmLab simulation environment provides physical properties
associated to either quadcopters or fixed-wing drones (based on
software implementation of the models in [5], [6]), including mass,
aerodynamics and control pa- rameters; path planning variables
represented by a series of waypoints (e.g., starting position S and
intermediate waypoints in rectangular terrains); and graphic tools to
plot state variables associated to the drones and obstacles.

We extended the original SwarmLab simulation environment in order to
represent and visualize risky zones (i.e., non-solid cylindrical
obstacles placed in the environment), as well the trajectory
traversing algorithms, adapting the obstacle avoidance schemes in
Refs. [3], [4], and their implementation in Swarmlab, to allow drones
applying new curvilinear trajectory strategies. What we do is to adapt
the potential functions, by assuming that solid obstacles are now
non-solid zones, hence relaxing the threshold potential schemes in the
original work. The idea is as follows. Drones, modeled in Swarmlab as
mobile agents, can pass through what were originally considered to be
obstacles, but minimizing now the overlap, and combining both
rectilinear and curvilinear itineraries, trough a series of
intermediate waypoints, in addition to source start position *S* and
target exit position *T*. Figure 2 depicts the idea by using three
intermediate waypoints, where the drone changes direction.

<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/curvilinear-feature1.png" width="95%"  />
<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/curvilinear-feature2.png" width="95%"  />

#### Figure 2. Example of a SwarmLab trajectory combining rectilinear (a,d) and curvilinear (b,d) trajectories. Intermediate waypoints *w<sub>1</sub>*, *w<sub>2</sub>*, and *w<sub>3</sub>* represent the trajectory moments in which the drone (represented by the red disc) changes the rectilinear reference, associated to red solid lines in (a) and (b), to circular references, i.e., red solid circles in (b) and (d).

Monte Carlo simulation results implemented with our extended version
of Swarmlab allows us to track and compare the amount of cumulative
risk levels vs. battery consumption of drones using either rectilinear
or curvilinear trajectories. Simulations use randomized configurations
with regard to zone sparsity and overlaps (cf. for instance results
plotted in Figures 3, 4, 5, and 6). We validate that curvilinear
trajectories minimize the risk, at the cost of increasing the battery
consumption.

<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/additional1.png" width="95%"  />
<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/additional2.png" width="95%"  />

#### Figure 3. (a,b,c) Rectilinear drone simulation at three different time intervals. (d) Simulation results in terms of distance (top) and risk (bottom) levels.


<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/additional3.png" width="95%"  />
<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/additional4.png" width="95%"  />

#### Figure 4. (a,b,c) Curvilinear drone simulation at three different time intervals. (d) Simulation results in terms of distance (top) and risk (bottom) levels


<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/results1.png" width="95%"  />
<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/results2.png" width="95%"  />
<img src="https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/results3.png" width="95%"  />

#### Figure 5. Simulation results using the new features of our modified SwarmLab simulation environment [2]. (a) Rectilinear single drone simulation. (b,c,d) Curvilinear trajectory simulations (following curvilinear references adapted from the collision avoidance algorithms in [3,4] with, respectively, one, ten and twenty drones. (e) Simulation results for rectilinear trajectory simulations. (f) Simulation results for curvilinear trajectory simulations.

[![Extended SwarmLab environment for risky zone avoidance](https://github.com/jgalfaro/mirrored-rswarm/blob/main/figures/youtube.png)](https://www.youtube.com/watch?v=KkCrjNprp5Y)

#### Figure 6. Click over the picture to see some videocaptures associated with our extended SwarmLab environment for risky zone avoidance.


### Conclusion

We have considered the problem of drones traversing terrains that may
expose them to certain risks, e.g., disturbing weather phenomena. The
goal of our work is to provide means to the drone to navigate the
terrain while minimizing the amount of risk. We have developed a model
for quantifying the exposure to a risk factor in a circular zone
model; and proposed two main strategies to evaluate the level of risk
reduction: either rectilinear or curvilinear trajectories. We have
validated the work by extending SwarmLab [2], a MATLAB simulation
environment for swarms of drones. We have shown that curvilinear
trajectories minimize the risk, at the cost of increasing the battery
consumption.

### Acknowledgments

Work partially supported by the Natural Sciences and Engineering
Research Council of Canada.


## References

If using this code for research purposes, please cite:

[1] M. Barbeau, J. Garcia-Alfaro, E. Kranakis. "Risky Zone Avoidance Strategies for Drones", 34th IEEE Canadian Conference on Electrical and Computer Engineering (CCECE), 2021. 

```
@inproceedings{barbeau2021ccece2021,
  title={{Risky Zone Avoidance Strategies for Drones}},
  author={Barbeau, Michel and Garcia-Alfaro, Joaquin and Kranakis, Evangelos},
  booktitle={34th IEEE Canadian Conference on Electrical and Computer Engineering (CCECE)},
  pages={},
  year={2021},
  month={ },
  publisher={IEEE},
  doi = {},
  url = {},
}```

[2] E. Soria, F. Schiano, and D. Floreano, Swarmlab: a matlab drone swarm
simulator, 2020. Available on-line at: https://github.com/lis-epfl/swarmlab

[3] R. Olfati-Saber and R. M. Murray, Distributed cooperative control
of multiple vehicle formations using structural potential functions,
in IFAC world congress, vol. 15, no. 1. Barcelona, Spain, 2002, pp.
242–248.

[4] G. Vasarhelyi, C. Vira ́gh, G. Somorjai, T. Nepusz, A. E. Eiben,
and T. Vicsek, Optimized flocking of autonomous drones in confined
environments, Science Robotics, vol. 3, no. 20, 2018.

[5] S. Bouabdallah and R. Siegwart, Full control of a quadrotor, in
2007 IEEE/RSJ International Conference on Intelligent Robots and
Systems. Ieee, 2007, pp. 153–158.

[6] R. W. Beard and T. W. McLain, Small unmanned aircraft: Theory and
practice. Princeton university press, 2012.

