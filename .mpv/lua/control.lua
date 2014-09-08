markA = ""
markB = ""
active = false

function set_active()
  active = not active
end

function set_mark()
  return tostring(mp.get_property("time-pos", ""))
end

function key_a()
  if active then
    markA = set_mark()
  end
  print(markA)
  --mp.command("seek 21 relative exact")
end

function key_A()
  if active then
    markB = set_mark()
  end
  print(markB)
end

mp.add_key_binding("m", set_active)
mp.add_key_binding("a", key_a)
mp.add_key_binding("A", key_A)
--mp.add_periodic_timer(3, get_timey)
