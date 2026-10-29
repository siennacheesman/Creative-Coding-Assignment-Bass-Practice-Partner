# Creative-Coding-Assignment-Bass-Practice-Partner
# Bass Practice Partner
Bass Practice Partner is an interactive, customisable 12-bar blues backing track developed using Sonic Pi to help bass guitarists practice improvisation. Users can adjust the key signature, tempo and accompanying instruments to suit their practice needs. As a bass guitarist, I developed this project to create a flexible practice tool while exploring how coding can be used to support musical creativity.
## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)
<!-- * [License](#license) -->


## General Information
Practicing bass improvisation often requires a backing track or other musicians to provide accompaniment. However, pre-recorded backing tracks often offer limited opportunities to customise the arrangement during practice, and are bass heavy, making it difficult to hear yourself playing clearly. 

Bass Practice Partner addresses this by allowing users to control different elements of a 12-bar blues arrangement in real time.

I developed this project as part of a university coding assignment, using my musical knowledge to explore programming concepts through a practical and creative application.

## Technologies Used
- Sonic Pi v5.0 on Mac
- Ruby based Domain Specific Language
- External audio sampling

## Features
- Adjustable key signature: Change the musical key without interrupting playback, with changes applied at the beginning of the next 12-bar progression.
- Tempo control: Adjust the playback speed to suit different practice levels.
- Individual instrument controls: Enable or disable individual instruments to customise the arrangement.
- Swing rhythm: Uses alternating beat durations to recreate the uneven rhythmic timing of swing jazz.
- Custom brass and wind sounds: Combines synthesisers and external audio samples to reproduce trombone, trumpet and saxophone sounds.
- Synchronised playback: Coordinates the different instrumental parts throughout the arrangement.


## Screenshots
<img width="472" height="370" alt="Screenshot 2026-10-29 at 12 26 26 pm" src="https://github.com/user-attachments/assets/9d4720e2-06df-4a75-a29d-156f96c4df03" />


## Setup
To run Bass Practice Partner: 
1. Download and Install Sonic Pi.
2. Download the project code and the accompanying audio samples:
   > trumpet.wav
   > alto-sax.wav
4. Open Sonic Pi and load the project code into a clean buffer.
5. Locate the sample commands in the trumpet and saxophone functions.
6. Replace existing file paths with the locations where you saved the corresponding .wav files on your computer.
7. Press RUN to start the backing track.
   
Important: Both audio files are required for the trumpet and saxophone parts to play correctly. The other instruments use Sonic Pi's built in synthesisers and samples.


## How to use
The main controls are located at the beginning of the code under BASS PRACTICE SETTINGS and INSTRUMENT CONTROLS. 
1. Adjusting the Tempo
Change the value of use_bpm to change the playback speed.

use_bmp 110

The default tempo is 110 beats per minute (BPM). Lower values produce a slower backing track while higher values increases the speed.

2. Changing the Key Signature
Modify requested_key to select the key you want to practice in.
set :requested_key, :d
The default key is D. Replace :d with another note, such as :c, :f or :g
The program automatically applies the requested key at the beginning of the next 12-bar progression, allowing the instruments to change key together without interuptting playback.

3. Selecting Instruments
Each instrument can be individually enabled or disabled using Boolean values (true or false)

set :piano_on, false
set :trombone_on, false
set :trumpet_on, false
set :sax_on, false
set :drums_on, true

> true - the instrument plays
> false - the instrument is muted

Change these values to create different combinations of accompaniment.
By default, only the drums are enabled.

4. Applying Changes
After adjusting the settings, press RUN again to update the program (this will not stop the playback).

5. Practicing improvisation
Once the backing track begins:
1. Listen to the four-beat count in
2. Play along with the repeating 12-bar progression
3. Experiment with different bass scales, improvisation techniques and rhythms
4. Adjust the tempo, key and accompanying instruments to create different practice scenarios 
   
## Project Status
Project is: Functional Prototype
The main features have been implemented. The project currently operates within Sonic Pi and requires users to modify settings through the code. 

## Room for Improvement

Room for improvement:
- User Interface: Develop a more intuitive interface that allows users to adjust settings without directly editing code.
- Accessibility: Conduct further testing with musicians of varying experience levels to ensure the controls are easy to understand.
- Code Structure: Improve the organisation of manually programmed melodies by introducing additional reusable functions.
- Instrument realism: Continue experimenting with external samples and sound manipulation to improve the quality of instruments, especially the saxophone, which I wasn't satisfied with. 




## Acknowledgements


