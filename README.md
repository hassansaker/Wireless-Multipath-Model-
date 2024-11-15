

# This MATLAB script simulates a scenario involving a Base Station (BS) 
# and a Mobile Station (MS) with Line of Sight (LOS) propagation. 
# The script evaluates the received signal in both time and frequency domains 
# for different angles of the mobile station's movement.

- Author: [Hassan saker]
- Date: [11/14/2024]
- Version: 1.0

### Overview
The code consists of two main parts:
1. **LOS Signal Simulation**: It calculates the received signal from the base station to the mobile station when moving directly towards it (0 degrees).
2. **Angle Variation Analysis**: It analyzes how the received signal changes as the angle of movement changes (45°, 90°, 135°, and 180°).

### Key Parameters
- `fc`: Carrier frequency in Hz (set to 2000 Hz).
- `F`: Number of samples per wavelength for spatial sampling (set to 16).
- `V`: Velocity of the mobile station in m/s (set to 10 m/s).
- `dBs`: Distance from the base station to the mobile station in meters (set to 1000 m).
- `alpha`: Angle of movement in degrees.

### Outputs
- **Frequency Domain Plot**: Displays the normalized amplitude spectrum of the received signal for an angle of 0°.
- **Subplots for Different Angles**: Displays normalized amplitude spectra for angles of 45°, 90°, 135°, and 180°.

### Requirements
- MATLAB environment with basic plotting capabilities.
- No additional toolboxes are required.

### How to Run
1. Open MATLAB.
2. Copy and paste the code into a new script or directly into the command window.
3. Run the script by executing it in MATLAB. The figures will automatically display after execution.

### Code Structure
1. **Initialization**: Clears workspace and closes all figures.
2. **Parameter Definition**: Sets up key parameters for simulation.
3. **LOS Signal Calculation**:
   - Computes distances from BS to MS.
   - Calculates the received signal based on LOS propagation.
   - Performs FFT to analyze frequency content.
4. **Angle Variation Analysis**:
   - Loops through specified angles, recalculating distances and received signals.
   - Plots results in subplots for each angle.

### Example Usage
To modify parameters such as carrier frequency or distance, simply change the values assigned to `fc`, `dBs`, or other parameters at the beginning of the script.

