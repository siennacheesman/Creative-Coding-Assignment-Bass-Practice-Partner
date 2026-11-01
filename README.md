# Creative-Coding-Assignment-Bass-Practice-Partner
# Bass Practice Partner
Bass Practice Partner is an interactive, customisable 12-bar blues backing track created using Sonic Pi to help bass guitarists practice jazz improvisation. Users can adjust the key signature, tempo and accompanying instruments to suit their practice needs. As a bass guitarist, I developed this project to create a flexible practice tool while exploring the creative possibilities of code. Please see Bass Practice Partner Prototype submission to see my code, Coding Progress folder was for my personal use.
## Table of Contents
* [General Info](#general-information)
* [Video Demonstration](#video-demonstration)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [How to use](#How-to-use)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
<!-- * [License](#license) -->


## General Information
Pre-recorded backing tracks aren't often ideal for bass practice, whether that is because they are already too bass heavy, or lacking opportunities to customise the arrangement during practice. 

Bass Practice Partner addresses this by allowing users to control different elements of a 12-bar blues arrangement in real time.

I developed this project as part of a university coding assignment, using my musical knowledge to explore programming concepts through a practical and creative application.

## Video Demonstration 
Watch Bass Practice Partner in action!
Watch video demonstration here > https://youtu.be/fyaDzqhWGfs

## Technologies Used
- Sonic Pi v5.0 on Mac
- Ruby based Domain Specific Language
- External audio sampling

## Features
- Adjustable key signature: Change the musical key without interrupting playback.
- Tempo control: Adjust the playback speed to suit different practice needs.
- Individual instrument controls: Enable or disable individual instruments to customise the arrangement.
- Swing rhythm: Uses uneven beat intervals to recreate a jazz swing feel.
- Instrument sounds: Uses both synthesisers and external audio samples to recreate a jazz ensemble, including trombone, percussion, keyboard trumpet and saxophone.
- Synchronised playback: Uses timing events to coordinate the instrumental parts.


## Screenshots
![Bass practice partner controls](images/sonic-pi-controls)



## Setup
To run Bass Practice Partner: 
1. Download and Install Sonic Pi.
2. Download the Sonic Pi code and both accompanying audio files from the repository:
   - Saxophone External Sample (to download)
   - Trumpet External Sample (to download)
4. Open Sonic Pi and load the project code into a clean buffer.
5. Locate the sample commands in the trumpet and saxophone functions.
6. Replace existing file paths by dragging and dropping the corresponding .wav files from your computer into Sonic Pi.
7. Press RUN to start the backing track.
   
Important: Both audio files are required for the trumpet and saxophone parts to play correctly. The other instruments use Sonic Pi's built in synthesisers and samples.


## How to use
The main controls are located at the beginning of the code under BASS PRACTICE SETTINGS and INSTRUMENT CONTROLS. 
1. Adjusting the Tempo
- Change the value of use_bpm to change the playback speed.
- The default tempo is 110 beats per minute (BPM). Lower values slow down the backing track, while higher values increase its speed.

2. Changing the Key Signature
- Modify requested_key to select the key you want to practice in.
- The default key is C. Replace :c with another note, such as :d, :f or :g
- The program applies the requested key at the next 12-bar progression, allowing instruments to change key together without interrupting playback.

3. Selecting Instruments
- Each instrument can be enabled or disabled independently using Boolean values (true or false)

   - true - the instrument plays
   - false - the instrument is muted

- Change these values to create different combinations of accompaniment.
- By default, only the drums are enabled.

4. Applying Changes
- After adjusting the settings, press RUN to apply your changes. Sonic Pi supports live coding, allowing the program to update while the music keeps playing.

5. Practicing improvisation
- Once the backing track begins:
1. Listen to the four-beat count in
2. Play along with the repeating 12-bar progression
3. Experiment with different bass scales, improvisation techniques and rhythms
4. Adjust the tempo, key and accompanying instruments to create different practice scenarios 
   
## Project Status
Project is: Functional Prototype
- All core features have been implemented, including adjustable key signature, tempo control and independent instrument settings. The prototype operates within Sonic Pi and currently requires users to modify settings directly in the code.

## Room for Improvement

Room for improvement:
- User Interface: Develop a more intuitive interface that allows users to adjust settings without directly editing code.
- Accessibility: Conduct further testing with musicians of varying experience levels to ensure the controls are easy to understand.
- Code Structure: Improve the organisation of manually programmed melodies by introducing additional reusable functions.
- Instrument realism: Continue experimenting with external samples and sound manipulation to improve the quality of instruments, especially the saxophone, which I wasn't satisfied with. 

## Acknowledgements
- Aaron, S. (2016, February). Code Music with Sonic Pi. The MagPi Magazine. https://magazine.raspberrypi.com/books/essentials-sonic-pi-v1
- Aaron, S., & Blackwell, A. F. (2013). From Sonic Pi to Overtone: Creative Musical Experiences with Domain-Specific and Functional Languages. FARM '13: Proceedings of the first ACM SIGPLAN workshop on Functional art, music, modeling & design, 35- 46. https://dl.acm.org/doi/pdf/10.1145/2505341.2505346
- Davids Music Lab. (2017, September 18). Swing & Walking Bass - Sonic Pi Tutorial [Video]. YouTube. https://www.youtube.com/watch?v=4x7RXApCu6s 
- How to play sample with notes? (2019, June 15). In_Thread. https://in-thread.sonic-pi.net/t/how-to-play-sample-with-notes/2487
- MagPi. (n.d.). Sonic Pi tutorial Pitch Bending. Sonic Pi. MagPi Articles. Retrieved 2 October 2026, from https://sonic-pi.net/tutorial-a.html#tut-a-17-sample-stretching
- Mehackit. (2021). Mehackit Creative Programming Workshop with Sonic Pi. Mehackit.Org. https://sonic-pi.mehackit.org/
- Sam Aaron. (n.d.). Sonic pi documentation (HI). Sam Aaron. Sonic Pi Documentation. Retrieved 8 October 2026, from https://sunderb.me/sonic-pi-docs-test/hi/reference/lang/sample.html
- Sonic Pi. (n.d.). 3.6 External samples. Sonic Pi. Sonic-Pi.Et. Retrieved 5 October 2026, from https://sonic-pi.net/tutorial-03.html
- Sonic Pi. (n.d.). 10 Time State. Sonic Pi. Retrieved October 2026, from https://sonic-pi.net/tutorial-10.html#tut-10-state
- Łyczywek, R. (2018, October 15). How to write a good README for your GitHub project? Bulldogjob. Bulldogjob.Com. https://bulldogjob.com/readme/how-to-write-a-good-readme-for-your-github-project
- Zulla, H. (2016, May 23). 7.3 Sliding-Parameters. GitHub. Sonic-Pi-Net . https://github.com/sonic-pi-net/sonic-pi/blob/dev/etc/doc/tutorial/07.3-Sliding-Parameters.md
