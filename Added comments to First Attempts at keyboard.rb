# Sets tempo for the whole piece
use_bpm 110

# Sets a variable for the key signature
key = :c

# These lines create the I, IV and V dominant 7th chords from the chosen key
# The IV chord is 5 semitones above the key and the V chord is 7 semitones above
i_chord = chord(key, :dom7)
iv_chord = chord(note(key) + 5,:dom7)
v_chord = chord(note(key) + 7, :dom7)

# The below line sets the instrument used (piano)
use_synth :piano

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


