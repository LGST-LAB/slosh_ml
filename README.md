# SLOSH-ML User Guide

## Overview
SLOSH-ML is an open-source, MATLAB-based graphical user interface (GUI) tool designed to obtain the mechanical analogy parameters representing linear lateral sloshing for axisymmetric tanks of any shape. The tool is based on the original algorithm developed by D.O. Lomen for NASA in the CR-230 report and subsequently updated by F.T. Dodge at the Southwest Research Institute (SwRI).

## Installation
If you have a Matlab version installed in your computer, simply download the source code and run `SLOSH_ML.mlapp`. Otherwise, you can access the Matlab binaries under `SLOSH_ML/bin`. Remember that the [Matlab Runtime environment](https://www.mathworks.com/products/compiler/matlab-runtime.html) is required to operate these binary files. This version of SLOSH-ML depends on version 9.14 (2023a) of the runtime.

## Required Dependencies
Access to the [MATLAB Optimization Toolbox](https://www.mathworks.com/products/optimization.html) is required to run SLOSH-ML from source.

## Formatting Contour Files
In order to specify a tank geometry in the app, the user must choose a single contour file, which contains the inner and outer contours of the tank. Contour files contain four comma separated columns: 
- Column 1: Height of the inner contour (z)
- Column 2: Radius of the inner contour (r)
- Column 3: Height of the outer contour (z)
- Column 4: Radius of the outer contour (r)
  
The inner and outer contours begin and end at the same height. It should be noted that the inner and outer contours are not required to have the same number of data points. If one contour has fewer points than the other, the empty space in the array should be filled in with NaN. In the app directory, there is a script titled `generateContour.m`. If the radius of both contours as a function of height are known, the user can modify and run this script to generate contour files for the desired tank geometry. Sample contour files are placed in the `contours` folder.

## Using SLOSH ML
1. Before running the app file, ensure that all the dependencies listed above are installed. 
2. Run the app through the MATLAB interface.
3. Navigate to the Geometry tab and load a contour file through the Load Contour button. The user will be prompted to open a file located in the contours directory. The user can choose from some simple test cases or input custom geometries. The process of building custom contour files is described above. After selecting a file, the chosen geometry will appear on the app figure and the user can adjust the R and Z factors to scale the geometry horizontally or vertically.
4. If necessary, open the units tab and select the desired system of units. If any inputs have already been entered into the physics tab, they will be converted automatically. Please note that the previously defined geometry is assumed to be in the desired units already and will not scale automatically.
5. Open the Physics tab and input the desired fluid density, surface tension, and acceleration. The user can also edit the integration settings through the Advanced tab, but this is not recommended as changing the number of shallow and deep tank modes could interfere with convergence. 
6. Press the calculate button. The core solver will compute the modes of the system and display the results in the app tables. The user can view eigenvectors and frequencies, mode information, pendulum parameters, and spring parameters in the Bulk Output, Modes, Pendulum, and Spring tabs, respectively. The calculation step can also be completed through the Parametric Analysis tab. This process is described below.
7. Navigate to the damping tab and select a tank geometry and correlation. If necessary, enter the number of baffles, baffle spacing, baffle width, and top baffle depth. The damping ratio of the given configuration will be computed automatically. Please note that if the selected geometry is cylindrical with baffles, the damping ratio will be normalized by the ratio of wave height to tank radius. Information on the damping correlations implemented in SLOSH-ML can be found below.

## Parametric Analysis
After inputting the contour data, geometry settings, and physical parameters (steps 1-4 above), the user can analyze a range of accelerations and fill ratios automatically through the parametric analysis tab instead of the calculate button. This process is as follows:
1. Navigate to the parametric analysis tab and press “Select File.” Input a comma-separated file containing fill ratio and acceleration data. The file should have 2 or 3 columns, with the first containing accelerations, and the second containing percent fill ratios. The third column is optional and lists the time at each data point. The fill ratios and accelerations loaded from the file will overwrite the values specified by the interface controls. Note that fill ratio should range from 0 to 100, exclusive.
2. Press “Compute” and wait for the app to finish the computation.
3. Press “Export” and select an output file name and location. The output file will list the acceleration, fill ratio, Weber number, Froude number, Bond number, modal frequencies, modal masses, pendulum lengths, pendulum mass heights, amplitude ratios, spring mass hinge points, and spring stiffnesses for each data point as a comma-separated file.

## Damping Correlations
### Empty Cylindrical Tank
SLOSH-ML includes two damping correlations for an empty cylindrical tank. The first was developed by D. G. Stephens, et al, using experimental results from 12 and 36 inch diameter tanks [7]. A second correlation, which was derived independently by G. N. Mikishev and N. Ya. Dorozhkin, is also included [4].
### Empty Spherical Tank
Damping in an empty spherical tank is computed using two correlations by Mikishev and Dorozhkin, with one corresponding to high fill ratios and one corresponding to low fill ratios [4]. These correlations characterize the damping ratio as a function of fill ratio experimentally, using a theoretical dependence on the viscosity parameter. It should be noted that this correlation has been scaled to account for differences between experimental and theoretical dependence on the viscosity parameter, as advised by H. Abramson [4].
### Cylindrical Tank with Ring Baffles
SLOSH-ML includes the ring baffle damping correlation proposed by H. Bauer, which accounts for a superposition of equally spaced ring baffles and is a generalization of an earlier formula derived by J. W. Miles for a single baffle [6]. Please note that baffle damping is nonlinear, and the damping ratio depends on the amplitude of oscillation. Since wave amplitude is unknown, the damping ratio will be normalized by wave height and displayed as damping ratio/(wave height/tank radius)^0.5.


## Current Repository for SLOSH-ML
Link to current repository: https://github.com/LGST-LAB/slosh_ml

## References
1. B. González, Pablo Martin García, Evan Thomas, Alba Casas Gómez, Juan Trobajo Flecha, Pablo Chiva Ruiz, Manuel Cortés Hernán, Rabia Shahid, Justin Effendi, Evan Sánchez, and Álvaro Romero-Calvo, "Open-Source Propellant Sloshing Modeling and Simulation," 2024 AAS Guidance, Navigation, and Control Conference, Breckenridge, CO, February 1-7, 2024, URL: https://www.researchgate.net/publication/377851094_Open-Source_Propellant_Sloshing_Modeling_and_Simulation
2. D. O. Lomen, “Digital analysis of liquid propellant sloshing in mobile tanks with rotational symmetry,” Tech. Rep. CR-230, NASA, 1965.
3. F. T. Dodge, The New “Dynamic Behavior of Liquids in Moving Containers.” Southwest Research Inst., 2000.
4. H. Abramson, "The dynamic behavior of liquids in moving containers, with applications to space vehicle technology," Tech. Rep. SP-106, N67-15884, NASA, August 1966.
5. R. Ibrahim, "Liquid sloshing," Tech. rep., Oxford, 2001, doi:https://doi.org/10.1006/rwvb.2001.0086.
6. H. Bauer, "The damping factor provided by flat annular ring baffles for free fluid surface oscillations," pp. 13, Tech. Rep. TM-X-50183, X63-14246, NASA, November 1962.
7. D. G. Stephens, L. H. Wayne, and T. W. Perry, "Investigation of the Damping of Liquids in Right-Circular Cylindrical Tanks, Including the Effects of a Time-Variant Liquid Depth," Tech. Rep. TN-D-1367, N62-14069, NASA, July 1962.
