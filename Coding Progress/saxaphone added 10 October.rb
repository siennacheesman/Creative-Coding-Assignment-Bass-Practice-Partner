# Sets tempo for the whole piece
use_bpm 110

#DRUMS

# Repeats the cymbal pattern continuously to create swing feel
live_loop :swing do
  # Amp controls the volume
  sample :drum_cymbal_closed, amp: 0.8
  # Cycles through uneven sleep values to create a long-short swing rhythm
  sleep (ring 0.66, 0.34).tick
end
# Repeats the bass drum pattern underneath the cymbal
live_loop :kick do
  sample :bd_tek, amp: 0.35
  sleep 2
  # Second hit is slightly quieter to make it less repetitive
  sample :bd_tek, amp: 0.3
  sleep 2
end

# Adds a softer snare rhythm with varied timing and volume
live_loop :snare do
  sleep 1
  sample :drum_snare_soft, amp: 0.6
  sleep 1.66
  sample :drum_snare_soft, amp: 0.4
  sleep 1.34
end

# KEYBOARD

key = :c
# These lines create the I, IV and V dominant 7th chords from the chosen key
# The IV chord is 5 semitones above the key and the V chord is 7 semitones above
i_chord = chord(key, :dom7)
iv_chord = chord(note(key) + 5,:dom7)
v_chord = chord(note(key) + 7, :dom7)

# The below line sets the instrument used (piano)
use_synth :piano
live_loop :piano do
  # Bar 1
  # Plays the chord for one bar
  # Sustain holds the cord for 3.5 beats
  # Release lets it fade out for 0.5 beats and sounds more natural
  play_chord i_chord, sustain: 3.5, release: 0.5
  # Moves to next bar
  sleep 4
  
  # Bar 2
  play_chord i_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 3
  play_chord i_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 4
  play_chord i_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 5
  play_chord iv_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 6
  play_chord iv_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 7
  play_chord i_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 8
  play_chord i_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 9
  play_chord v_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 10
  play_chord iv_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 11
  play_chord i_chord, sustain: 3.5, release: 0.5
  sleep 4
  
  # Bar 12
  play_chord v_chord, sustain: 3.5, release: 0.5
  sleep 4
end
# TRUMPET
define :play_trumpet do |pitch, volume=0.8, ending=0.5|
  sample "/Users/siennacheesman/Desktop/trumpet.wav",
    rpitch: pitch - note(:c5),
    start: 0.2,
    finish: ending,
    amp: volume
end
# TROMBONE
# set trombone one octave below key
root = note(key) - 24
minor_third = root + 3
fourth = root + 5
flat_fifth = root + 6
fifth = root + 7
flat_seventh = root + 10
octave = root + 12

live_loop:trombone do
  use_synth :prophet
  
  # Bar 1
  play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play fourth, attack: 0.1, release: 0.8, cutoff:80, amp: 0.9
  sleep 2
  
  # Bar 2
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
  
  # Bar 3
  play fourth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play root, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
  sleep 2
  
  # Bar 4
  play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  # ADD SLIDE
  s = play fourth, sustain: 1.5, release: 0.5,
    note_slide: 0.25, cutoff: 80, amp: 0.9
  sleep 1
  control s, note: fifth
  sleep 1
  
  # Bar 5
  play fourth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  # ADD SLIDE
  s = play flat_fifth, sustain: 2.5, release: 0.5,
    note_slide: 0.3, cutoff: 80, amp: 0.8
  sleep 2
  control s, note: fifth
  sleep 1
  
  # Bar 6
  play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play fifth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play fourth, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
  sleep 2
  
  # Bar 7
  play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play root, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play fifth, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
  sleep 2
  
  # Bar 8
  play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  # ADD SLIDE
  s = play fifth, sustain: 2.5, release: 0.5,
    note_slide: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  control s, note: root
  sleep 2
  
  # Bar 9
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
  
  # Bar 10
  play fourth, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play minor_third, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.8
  sleep 1
  play root, attack: 0.1, release: 0.8, cutoff: 80, amp: 0.9
  sleep 2
  
  # Bar 11
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
  
  # Bar 12
  play flat_seventh, attack: 0.1, release: 0.4, cutoff: 80, amp: 0.9
  sleep 1
  # ADD DECENDING SLIDE BACK TO ROOT
  s= play fifth, sustain: 2.5, release: 0.8,
    note_slide: 0.4, cutoff:80, amp: 1
  sleep 1
  control s, note: root
  sleep 2
  
end

# 12 Bar blues trumpet
live_loop :trumpet do
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
  sample "/Users/siennacheesman/Downloads/584383__totalaj__alto-sax-c5.wav",
    rpitch: pitch - note(:c5),
    start: 0,
    finish: ending,
    amp: volume
end



live_loop :saxaphone do
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
