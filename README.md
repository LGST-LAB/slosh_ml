# SLOSH ML version 0.1_beta User Guide

## Overview
SLOSH ML version v0.1_beta is an open-source, MATLAB-based graphical user interface (GUI) tool from the LGST (Low Gravity Science and Technology) Lab at Georgia Tech that analyzes rocket propellant sloshing in different tank shapes for space launch vehicles utilizing a spring-mass model. It is based on the SLOSH-XL tool created by F.T. Dodge at the Southwestern Research Institute.

## Required Dependencies
The user will need the following dependencies to run the SLOSH ML program:
* MATLAB Optimization Toolbox

## Formatting Contour Files:
In order to specify a tank geometry in the app, the user must choose a single contour file, which contains the inner and outer contours of the tank. Contour files contain four comma separated columns. The first two columns are a list of ordered pairs of the form (z, r), which are the height and radius of the inner contour. Similarly, the third and fourth columns are the height and radius of the outer contour. The inner and outer contours should begin and end at the same height. It should be noted that the inner and outer contours are not required to have the same number of data points. If one contour has fewer points than the other, the empty space in the array should be filled in with NaN. In the app directory, there is a script titled “generateContour.m.” If the radius of both contours as a function of height are known, the user can modify and run this script to generate contour files for the desired tank geometry. Contour files should be placed in the contours folder.

## Using SLOSH ML:
1. Before running the app file, ensure that all of the required dependencies (listed above) are installed. 
2. Run the app through the MATLAB interface.
3. Navigate to the Geometry tab and load a contour file through the Load Contour button. The user will be prompted to open a file located in the contours directory. The user can choose from some simple test cases or input custom geometries. The process of building custom contour files is described above. After selecting a file, the chosen geometry will appear on the app figure and the user can adjust the R and Z factors to scale the geometry horizontally or vertically.
4. Open the Physics tab and input the desired fluid density, surface tension, and acceleration. The user can also edit the integration settings through the Advanced tab, but this is not recommended as changing the number of shallow and deep tank modes could interfere with convergence.
5. Press the calculate button. The core solver will compute the modes of the system and display the results in the app tables. The user can view eigenvectors and frequencies, mode information, pendulum parameters, and spring parameters in the Bulk Output, Modes, Pendulum, and Spring tabs, respectively. The calculation step can also be completed through the Parametric Analysis tab. This process is described below.

## Parametric Analysis:
After inputting the contour data, geometry settings, and physical parameters (steps 1-4 above), the user can analyze a range of accelerations and fill ratios automatically through the parametric analysis tab instead of the calculate button. This process is as follows:
1. Navigate to the parametric analysis tab and press “Select File.” Input a comma-separated file containing fill ratio and acceleration data. The file should have 2 or 3 columns, with the first containing accelerations, and the second containing percent fill ratios. The third column is optional and lists the time at each data point. The fill ratios and accelerations loaded from the file will overwrite the values specified by the interface controls. Note that fill ratio should range from 0 to 100, exclusive.
2. Press “Compute” and wait for the app to finish the computation.
3. Press “Export” and select an output file name and location. The output file will list the acceleration, fill ratio, Weber number, Froude number, Bond number, modal frequencies, modal masses, pendulum lengths, pendulum mass heights, amplitude ratios, spring mass hinge points, and spring stiffnesses for each data point as a comma-separated file.

## Current Repository for SLOSH-ML
Link to current repository: https://github.com/LGST-LAB/slosh_ml
