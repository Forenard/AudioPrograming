# Welcome to Sonic Pi

# Welcome to Sonic Pi
live_loop :riff do
  use_synth :piano
  if one_in(2)
    8.times do
      r=rrand(:c4,:b3)
      ch=chord(r,'7')
      
      play ch,pan: rrand(-0.5,0.5),amp: 0.5
      
      sleep rrand(0.125,0.5)
    end
  else
    8.times do
      r=rrand(:c4,:b3)
      ch=chord(r,:m)
      play ch ,pan: rrand(-0.5,0.5),amp: 0.5
      sleep 0.25
    end
  end
end

live_loop :bd do
  use_synth   :sound_in_stereo
  sample   :loop_drone_g_97,amp: 0.3
  play :c4
  sleep 4
end

live_loop :sq do
  use_synth  :piano
  sample :bd_pure,cutoff: 40
  sample
  1.times do
    play scale(:c4,:minor).shuffle.take(2),release: 0.1
    sleep 0.25
  end
end
