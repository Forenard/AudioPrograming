root1=:d2
root2=root1+7

live_loop :algo do
  root1=choose([:a3,:b3,:c2,:d2,:e2,:f2,:g2])
  root2=root1+7
  sleep 8
end


live_loop :drum do
  sample :bd_haus,cutoff: 80,amp: 2.5
  sleep 0.25
  if one_in(4)
    4.times do
      sample :drum_cymbal_closed,rate: 1.2
      sleep 0.25/4
    end
  else
    2.times do
      sample :drum_cymbal_closed,rate: 1.2
      sleep 0.25/2
    end
  end
end

live_loop :random_bd do
  if one_in(3)
    sample :bd_haus,rate: choose([1,2,4]),amp: 1.5
  end
  sleep 0.25/2
end

live_loop :harmony do
  with_fx :panslicer,phase: 0.25 do
    use_synth :dsaw
    play chord(root1,:m7,num_octaves: 4)
    sleep 4
    play chord(root2,:m7,num_octaves: 4),release: 3,cutoff: 95,amp: 1.5
    sleep 4
  end
end

live_loop :riff do
  with_fx :echo ,phase: 0.375 do
    use_synth :dsaw
    32.times do
      play scale(root1,:minor_pentatonic,num_octaves: 4).shuffle.take(2),release: rand(0.5),cutoff: rrand(70,130),pan: rrand(-0.7,0.7),amp: 0.8
      sleep 4.0/32.0
    end
    32.times do
      play scale(root2,:minor_pentatonic,num_octaves: 4).shuffle.take(2),release: rand(0.5),cutoff: rrand(70,130),pan: rrand(-0.7,0.7),amp: 0.8
      sleep 4.0/32.0
    end
  end
end
