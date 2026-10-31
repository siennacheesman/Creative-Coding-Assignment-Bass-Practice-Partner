# Reference list
# Davids Music Lab. (2017, September 18). Swing & Walking Bass - Sonic Pi Tutorial [Video]. YouTube. https://www.youtube.com/watch?v=4x7RXApCu6s
# How to play sample with notes? (2019, June 15). In_Thread. https://in-thread.sonic-pi.net/t/how-to-play-sample-with-notes/2487
# MagPi. (n.d.). Sonic Pi tutorial Pitch Bending. Sonic Pi. MagPi Articles. Retrieved 2 October 2026, from https://sonic-pi.net/tutorial-a.html#tut-a-17-sample-stretching
# Mehackit. (2021). Mehackit Creative Programming Workshop with Sonic Pi. Mehackit.Org. https://sonic-pi.mehackit.org/
# Sam Aaron. (n.d.). Sonic pi documentation (HI). Sam Aaron. Sonic Pi Documentation. Retrieved 30 February 2026, from https://sunderb.me/sonic-pi-docs-test/hi/reference/lang/sample.html
# Sonic Pi. (n.d.). 3.6 External samples. Sonic Pi. Sonic-Pi.Et. Retrieved 5 October 2026, from https://sonic-pi.net/tutorial-03.html
# Zulla, H. (2016, May 23). 7.3 Sliding-Parameters. GitHub. Sonic-Pi-Net . https://github.com/sonic-pi-net/sonic-pi/blob/dev/etc/doc/tutorial/07.3-Sliding-Parameters.md

# BASS PRACTICE SETTINGS
# Change this to set tempo
use_bpm 110

# Change this to set key, key changes take effect at the next progression
# Store's the users chosen key in shared Time State
set :requested_key, :d

# INSTRUMENT CONTROLS
# true = instrument plays
# false = instrument muted

set :piano_on, false
set :trombone_on, false
set :trumpet_on, false
set :sax_on, false
set :drums_on, true

# 12 BAR SYNCHRONISATION LOOP
# Runs continuously in a seperate thread, repeating every 48 beats
# Coordinates key changes and the start of each 12-bar progression
live_loop :blues_clock do
  # Pauses execution for a four-beat drum count-in
  sleep 4
  
  # Retrieves the requested key from shared memory
  # Stores it as the active key for the next progression
  set :active_key, get(:requested_key)
  
  # Displays the active key in the log
  puts "Current key: #{get(:active_key)}"
  
  # Sends an event to release instrument loops waiting at sync
  cue :start_blues
  
  # Pauses for the remaining 44 beats of the 48-beat cycle
  sleep 44
end


# DRUMS

# Repeats the cymbal pattern independedntly in its own thread
live_loop :swing do
  if get(:drums_on)
    # Amp controls the volume
    sample :drum_cymbal_closed, amp: 0.8
  end
  # Ring stores a repeating sequence of two uneven beat durations
  # Tick advances through the sequence on each loop iteration
  # Alternating 0.66 and 0.34 beats create a swing rhythm
  # Davids Music Lab. (2017, September 18). Swing & Walking Bass - Sonic Pi Tutorial [Video]. YouTube. https://www.youtube.com/watch?v=4x7RXApCu6s
  sleep (ring 0.66, 0.34).tick
end
# Repeats the bass drum pattern underneath the cymbal
live_loop :kick do
  if get(:drums_on)
    sample :bd_tek, amp: 0.35
  end
  sleep 2
  if get(:drums_on)
    # Second hit is slightly quieter to make it less repetitive
    sample :bd_tek, amp: 0.3
  end
  sleep 2
end

# Adds a softer snare rhythm with varied timing and volume
live_loop :snare do
  sleep 1
  if get(:drums_on)
    sample :drum_snare_soft, amp: 0.6
  end
  sleep 1.66
  if get(:drums_on)
    
    sample :drum_snare_soft, amp: 0.4
  end
  sleep 1.34
end

# REUSABLE PIANO FUNCTION
# Encapsulates the instructions for playing a chord
# The note parameter allows different chords to use the same function
define :play_piano_chord do |notes|
  
  # Retrieves the piano's Boolean setting from shared memory
  # Executes the chord instructions only when enabled
  if get(:piano_on)
    play_chord notes, sustain: 3.5, release: 0.5 # Sustain- hold the chord for 3.5 beats, Release-  lets it fade out for 0.5 beats and sound more natural
  end
end

live_loop :piano do
  sync :start_blues
  # Retrive the current key
  key = get(:active_key)
  
  # Calculates the I, IV and V dominant seventh chords
  # Sonic Pi's chord function generates the individual chord notes from the supplied root pitch and chord type
  # Arithmetic operators transpose the root by 5 and 7 semitones
  
  i_chord = chord(key, :dom7)
  iv_chord = chord(note(key) + 5,:dom7)
  v_chord = chord(note(key) + 7, :dom7)
  
  use_synth :piano
  
  # Very simple composition, just playing the blues chord progression
  
  # Bar 1
  play_piano_chord i_chord
  sleep 4
  
  # Bar 2
  play_piano_chord i_chord
  sleep 4
  
  # Bar 3
  play_piano_chord i_chord
  sleep 4
  
  # Bar 4
  play_piano_chord i_chord
  sleep 4
  
  # Bar 5
  play_piano_chord iv_chord
  sleep 4
  
  # Bar 6
  play_piano_chord iv_chord
  sleep 4
  
  # Bar 7
  play_piano_chord i_chord
  sleep 4
  
  # Bar 8
  play_piano_chord i_chord
  sleep 4
  
  # Bar 9
  play_piano_chord v_chord
  sleep 4
  
  # Bar 10
  play_piano_chord iv_chord
  sleep 4
  
  # Bar 11
  play_piano_chord i_chord
  sleep 4
  
  # Bar 12
  play_piano_chord v_chord
  sleep 4
end


# TROMBONE
live_loop:trombone do
  sync :start_blues
  # Retrive current key
  key = get(:active_key)
  
  # Subtracts 24 semitones to lower the root by two octaves
  root = note(key) - 24
  
  # Calculates notes relative to the root, allowing melody to transpose automatically whenever the active key changes
  minor_third = root + 3
  fourth = root + 5
  flat_fifth = root + 6
  fifth = root + 7
  flat_seventh = root + 10
  octave = root + 12
  
  use_synth :prophet
  
  # Bar 1
  if get(:trombone_on)
    
    play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play fourth, attack: 0.1, release: 0.8, cutoff:80, amp: 0.9
    sleep 2
    
    # When muted it will skip the melody but preserve its four-beat duration
    # This prevents the loop from progressing too quickly when muted
  else
    sleep 4
  end
  
  # Bar 2
  if get(:trombone_on)
    
    play fifth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    # ADD SLIDE
    # Zulla, H. (2016, May 23). 7.3 Sliding-Parameters. GitHub. Sonic-Pi-Net . https://github.com/sonic-pi-net/sonic-pi/blob/dev/etc/doc/tutorial/07.3-Sliding-Parameters.md
    # Plays a note and stores a reference to the sound in variable s
    
    s = play fifth, sustain: 1.5, release: 0.5,
      note_slide: 0.3, cutoff: 80, amp: 0.8
    sleep 1
    
    # Changes the pitch of the existing sound to imitate a trombone slide
    # note_slide determines the duration of the pitch transition
    
    control s, note: fourth
    sleep 1
  else
    sleep 4
  end
  
  # Bar 3
  if get(:trombone_on)
    
    play fourth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play root, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
    sleep 2
  else
    sleep 4
  end
  
  # Bar 4
  if get(:trombone_on)
    
    play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    # SLIDE
    s = play fourth, sustain: 1.5, release: 0.5,
      note_slide: 0.25, cutoff: 80, amp: 0.9
    sleep 1
    control s, note: fifth
    sleep 1
  else
    sleep 4
  end
  
  # Bar 5
  if get(:trombone_on)
    
    play fourth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    # ADD SLIDE
    s = play flat_fifth, sustain: 2.5, release: 0.5,
      note_slide: 0.3, cutoff: 80, amp: 0.8
    sleep 2
    control s, note: fifth
    sleep 1
  else
    sleep 4
  end
  
  # Bar 6
  if get(:trombone_on)
    
    play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play fifth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play fourth, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
    sleep 2
  else
    sleep 4
  end
  
  # Bar 7
  if get(:trombone_on)
    
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play fifth, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
    sleep 2
  else
    sleep 4
  end
  
  # Bar 8
  if get(:trombone_on)
    
    play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    # ADD SLIDE
    s = play fifth, sustain: 2.5, release: 0.5,
      note_slide: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    control s, note: root
    sleep 2
  else
    sleep 4
  end
  
  # Bar 9
  if get(:trombone_on)
    
    play fifth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.9
    sleep 1
    play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.9
    sleep 1
    # ADD SLIDE UP TO OCTAVE
    s = play flat_seventh, sustain: 1.5, release: 0.5,
      note_slide: 0.3, cutoff: 80, amp: 1
    sleep 1
    control s, note: octave
    sleep 1
  else
    sleep 4
  end
  
  # Bar 10
  if get(:trombone_on)
    
    play fourth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play root, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
    sleep 2
  else
    sleep 4
  end
  
  # Bar 11
  if get(:trombone_on)
    
    play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    #ADD SLIDE
    s = play fourth, sustain: 1.5, release: 0.5,
      note_slide: 0.25, cutoff: 80, amp: 0.9
    sleep 1
    control s, note: fifth
    sleep 1
  else
    sleep 4
  end
  
  # Bar 12
  if get(:trombone_on)
    play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.9
    sleep 1
    # ADD DECENDING SLIDE BACK TO ROOT
    s= play fifth, sustain: 2.5, release: 0.8,
      note_slide: 0.4, cutoff:80, amp: 1
    sleep 1
    control s, note: root
    sleep 2
  else
    sleep 4
  end
end

# REUSABLE TRUMPET FUNCTION
# Encapsulates the instructions for playing and manipulating the external trumpet recording
# Parameters allow pitch, volume and sample length to vary without rewriting underlying playback instructions
define :play_trumpet do |pitch, volume=0.8, ending=0.5|
  
  # Only plays the sample when the trumpet is enabled
  if get(:trumpet_on)
    # Loads the external c5 recording
    sample "/Users/siennacheesman/Desktop/trumpet.wav", # DRAG TRUMPET WAV FILE HERE!
      
    # Calculates the semitone difference from the original c5 and transposes the recording to the requested pitch
    rpitch: pitch - note(:c5),
      
    # Selects which portion of the recording is played
    start: 0.2,
      finish: ending,
      # Controls playback volume
      amp: volume
  end
end

# Timing continues even when muted because sleep commands are outside of the function's conditional statement

live_loop :trumpet do
  sync :start_blues
  key = get(:active_key)
  # Arithmetic operators
  root = note(key) - 24
  minor_third = root + 3
  fourth = root + 5
  flat_fifth = root + 6
  fifth = root + 7
  flat_seventh = root + 10
  octave = root + 12
  
  # Trumpet is playing little melodic fills, usually a few notes per bar
  
  # Bar 1
  sleep 1
  # Calls the reusable function with a calculated pitch, volume and sample ending position
  # Different arguments produce different notes using the same function
  
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet flat_seventh + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.5
  sleep 2
  
  # Bar 2
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet minor_third + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.5
  sleep 3
  
  # Bar 3
  sleep 2
  play_trumpet root + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet minor_third + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth +36, 0.8, 0.5
  sleep 1
  
  # Bar 4
  play_trumpet fifth +36, 0.8, 0.5
  sleep 1
  play_trumpet flat_seventh +36, 0.8, 0.35
  sleep 0.66
  play_trumpet flat_seventh +36, 0.8, 0.6
  sleep 2.34
  
  # Bar 5
  sleep 1
  play_trumpet fourth + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet flat_fifth + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.5
  sleep 2
  
  # Bar 6
  play_trumpet flat_seventh + 36, 0.7, 0.35
  sleep 1
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 1
  play_trumpet minor_third + 36, 0.8, 0.6
  sleep 2
  
  # Bar 7
  sleep 0.66
  play_trumpet root + 36, 0.7, 0.3
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.4
  sleep 3
  
  # Bar 8
  sleep 2
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet root + 36, 0.8, 0.5
  sleep 1
  
  # Bar 9
  play_trumpet fifth + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.34
  play_trumpet octave + 36, 0.9, 0.6
  sleep 3
  
  # Bar 10
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fourth + 36, 0.7, 0.4
  sleep 1
  play_trumpet minor_third + 36, 0.8, 0.5
  sleep 2
  
  # Bar 11
  sleep 1
  play_trumpet root + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet minor_third + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth +36, 0.8, 0.5
  sleep 2
  
  # Bar 12
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet fifth + 36, 0.8, 0.35
  sleep 0.34
  play_trumpet minor_third + 36, 0.7, 0.4
  sleep 1
  play_trumpet root + 36, 0.9, 0.7
  sleep 2
  
end
# As mentioned earlier, don't need else branch here as timing is outside the conditional trumpet function

# REUSABLE SAXOPHONE FUNCTION
# Uses the same sampling abstraction as the trumpet function
# Parameters control pitch, volume and sample length

define :play_sax do |pitch, volume=1.0, ending=0.3|
  if get(:sax_on)
    sample "/Users/siennacheesman/Downloads/584383__totalaj__alto-sax-c5.wav", #DRAG SAXOPHONE WAV FILE HERE
      rpitch: pitch - note(:c5),
      start: 0,
      finish: ending,
      amp: volume
  end
end

live_loop :saxaphone do
  sync :start_blues
  key = get(:active_key)
  
  root = note(key) - 24
  minor_third = root + 3
  fourth = root + 5
  flat_fifth = root + 6
  fifth = root + 7
  flat_seventh = root + 10
  octave = root + 12
  
  # The saxophone sound clashed a bit with the other instruments, which is why it is resting for a lot of the composition. Further development would include improving the saxophone part!
  
  # Bar 1
  sleep 4
  
  # Bar 2
  sleep 4
  
  # Bar 3
  play_sax root + 36, 0.35, 0.35
  sleep 1
  play_sax minor_third + 36, 0.4, 0.35
  sleep 1
  sleep 2
  
  # Bar 4
  sleep 4
  
  # Bar 5
  sleep 4
  
  # Bar 6
  play_sax fifth + 36, 1.0, 0.3
  sleep 2
  play_sax fourth + 36, 1.0, 0.3
  sleep 2
  
  # Bar 7
  sleep 4
  
  #Bar 8
  sleep 4
  
  # Bar 9
  sleep 2
  play_sax fifth + 36, 1.0, 0.3
  sleep 2
  
  # Bar 10
  sleep 4
  
  # Bar 11
  sleep 4
  
  # Bar 12
  play_sax fifth + 36, 1.0, 0.3
  sleep 2
  play_sax flat_seventh + 36, 1.0, 0.3
  sleep 2
end