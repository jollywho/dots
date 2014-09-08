markA = ""
markB = ""
active = false
istimer = false
timer = Nil

function set_active()
  active = not active
  print(active)
end

function set_mark()
  active = false
  return tostring(mp.get_property("time-pos", ""))
end

function key_a()
  if active then
    markA = set_mark()
  elseif not(markA == "") then
    cmd = "seek " .. markA .. " absolute exact"
    mp.command(cmd)
  end
  print(markA)
end

function key_A()
  if active then
    markB = set_mark()
  elseif not(markB == "") then
    cmd = "seek " .. markB .. " absolute exact"
    mp.command(cmd)
  end
  print(markB)
end

function key_R()
  istimer = not istimer
  timeit()
end

function timeit()
  if istimer then
    if markA ~= "" and markB ~= "" then
      d1 = (markA > markB) and markA or markB
      d2 = (markA < markB) and markA or markB
      d = d1 - d2
      timer = mp.add_timeout(d, timeit)
      if markA > markB then
        key_A()
      else
        key_a()
      end
    end
  end
end

mp.add_key_binding("m", set_active)
mp.add_key_binding("a", key_a)
mp.add_key_binding("A", key_A)
mp.add_key_binding("R", key_R)
