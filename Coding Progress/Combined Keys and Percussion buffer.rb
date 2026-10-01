# Sets tempo for the whole piece
use_bpm 110

# Repeats the cymbal pattern continuously to create swing feel
live_loop :swing do
  # Amp controls the volume
  sample :drum_cymbal_closed, amp: 0.8
  # Cycles through uneven sleep values to create a long-short swing rhythm
  sleep (ring 1, 0.7, 0.3).tick
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

