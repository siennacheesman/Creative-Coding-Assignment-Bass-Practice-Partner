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