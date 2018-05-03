---
title: "Cellular automata/particle simulator"
date: 2018-02-13T13:42:49-05:00
type: portfolio
---
Particle simulator          Cellular automata          Unlimited particles          Quantized
Floating point absorbtion          Blurring          Parallelism
Practicality          Exponential?

Goal: simulate an effictively arbitrary number of particles with fixed resources at a given resolution. [chain reaction video]

I don't remember why, but I became interested in representing worlds that were detailed up to the available computing power

I don't remember how the idea occurred to me, but at some point I thought of about a particle simulator that traded of resolution for particle count in a big way.

## How it works
The first trade off is positional resolution: each particle is snapped to a position on a grid representing the available, finite space. So instead of a particle at position (1.2345, 6.789), the particles  exist at positions ranging from, say, (0, 0) to (99, 99) in integer steps. Note that there is, effectively, one particle at each position, a representative particle. If two particles move to the same position, they're fused into a single particle in the same position whose magnitude is the sum of the magnitudes of the original particles.

Next, direction was quantized. Any given particle is headed in one of a fixed number of evenly spaced directions given by an angle. Now again, there is effectively only one particle traveling in a given direction at a given position. So the total number of particles goes from w\*h (the number of positions) to w\*h\*d (the number of positions times the number of directions). And again, there is effectively only one particle for each combination. If two particles occupy the same direction/position combination they are fused into a single particle with the magnitude of both particles together.

This process can be repeated with any number of other state elements, such as speed, frequency, particle type, or charge. Unfortunately, the amount of state grows exponentially with the number of state elements if the resolution of each element is the same. Clearly this is untenable for more than a small variety of low resolution factors.

Finally, particles move to adjacent cells over time. Time is taken as a series of discrete evenly spaced steps.

## Implementation details





Method: grid of cells with quantized "representative" cells + magnitude. Every combo of direction, speed, frequency, type, etc. "Matter" plane single valued grid that recomputes particle values in the associated cell. "Blurring": particles decompose slightly to the left and right over time to fill the space between adjacent particles as they separate because they are moving in slightly different directions. [blurring video]

Benefits: things like chain reactions don't change the performance charateristics of any particular simulation. [ping pong nova video]

Issues: quantization limits accuracy. Quantizing all possible combinations requires excessive memory which requires excessive compute. Small magnitudes will be silently absorbed by large magnitudes due to floating point arithmetic and thus will not necessarily build up over time. Seems like you'd always get better results by tracking individual particles and dropping small magnitudes (since you could typically track a LOT of particles for an equivalent system.)

