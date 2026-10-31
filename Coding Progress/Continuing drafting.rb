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

# Change this to set key for next progression
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
# Updates selected key and signals the start of each new 12-bar blues progression
live_loop :blues_clock do
  sleep 4 # Four-beat drum count-in
  
  # Updates the active key for the next progression
  set :active_key, get(:requested_key)
  
  # Displays the current key in the log
  puts "Current key: #{get(:active_key)}"
  
  # Signals all instrumnents to begin
  cue :start_blues
  # Completes the 48-beat clock cycle
  sleep 44
end


# DRUMS

# Repeats the cymbal pattern continuously
live_loop :swing do
  if get(:drums_on)
    # Amp controls the volume
    sample :drum_cymbal_closed, amp: 0.8
  end
  # Cycles through uneven sleep values to create a swing rhythm
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

# KEYBOARD
# Keyboard will only play when turned on (true)
define :play_piano_chord do |notes|
  if get(:piano_on)
    play_chord notes, sustain: 3.5, release: 0.5 # Sustain- hold the chord for 3.5 beats, Release-  lets it fade out for 0.5 beats and sound more natural
  end
end

live_loop :piano do
  sync :start_blues
  # Retrive the current key
  key = get(:active_key)
  
  # Calculate chords from current key
  # These lines create the I, IV and V dominant 7th chords from the chosen key
  # The IV chord is 5 semitones above the key and the V chord is 7 semitones above
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
  # Sets trombone one octave below key
  root = note(key) - 24
  # Bases notes off root using arithmetic operators so adjustable key signatrue can apply
  minor_third = root + 3
  fourth = root + 5
  flat_fifth = root + 6
  fifth = root + 7
  flat_seventh = root + 10
  octave = root + 12
  
  use_synth :prophet
  
  # BAR 1
  if get(:trombone_on)
    
    play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
    sleep 1
    play fourth, attack: 0.1, release: 0.8, cutoff:80, amp: 0.9
    sleep 2
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
    s = play fifth, sustain: 1.5, release: 0.5,
      note_slide: 0.3, cutoff: 80, amp: 0.8
    sleep 1
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
  
  # BAR 4
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



# TRUMPET
# Setting up external sample
define :play_trumpet do |pitch, volume=0.8, ending=0.5|
  if get(:trumpet_on)
    sample "/Users/siennacheesman/Desktop/trumpet.wav", #DRAG TRUMPET WAV FILE HERE!
      rpitch: pitch - note(:c5),
      start: 0.2,
      finish: ending,
      amp: volume
  end
end

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
  
  #bar 1
  sleep 1
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet flat_seventh + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.5
  sleep 2
  
  #bar 2
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet minor_third + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.5
  sleep 3
  
  #bar 3
  sleep 2
  play_trumpet root + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet minor_third + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth +36, 0.8, 0.5
  sleep 1
  
  #bar 4
  play_trumpet fifth +36, 0.8, 0.5
  sleep 1
  play_trumpet flat_seventh +36, 0.8, 0.35
  sleep 0.66
  play_trumpet flat_seventh +36, 0.8, 0.6
  sleep 2.34
  
  #bar 5
  sleep 1
  play_trumpet fourth + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet flat_fifth + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.5
  sleep 2
  
  #bar 6
  play_trumpet flat_seventh + 36, 0.7, 0.35
  sleep 1
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 1
  play_trumpet minor_third + 36, 0.8, 0.6
  sleep 2
  
  #bar 7
  sleep 0.66
  play_trumpet root + 36, 0.7, 0.3
  sleep 0.34
  play_trumpet fifth + 36, 0.8, 0.4
  sleep 3
  
  #bar 8
  sleep 2
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet root + 36, 0.8, 0.5
  sleep 1
  #bar 9
  play_trumpet fifth + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.34
  play_trumpet octave + 36, 0.9, 0.6
  sleep 3
  
  #Bar 10
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet fifth + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fourth + 36, 0.7, 0.4
  sleep 1
  play_trumpet minor_third + 36, 0.8, 0.5
  sleep 2
  
  #bar 11
  sleep 1
  play_trumpet root + 36, 0.7, 0.35
  sleep 0.66
  play_trumpet minor_third + 36, 0.7, 0.35
  sleep 0.34
  play_trumpet fifth +36, 0.8, 0.5
  sleep 2
  
  #bar 12
  play_trumpet flat_seventh + 36, 0.8, 0.35
  sleep 0.66
  play_trumpet fifth + 36, 0.8, 0.35
  sleep 0.34
  play_trumpet minor_third + 36, 0.7, 0.4
  sleep 1
  play_trumpet root + 36, 0.9, 0.7
  sleep 2
  
end
# SAXOPHONE
# function to play imported saxaphone c5 note
#rpitch adjusts the sample from its original c5 pitch
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
