--
-- left/right racing pedals to rudder/heading mapper
-- version 1.2 - 20210531 - melbo @x-plane.org
--

-- axis types
-- 1 pitch
-- 2 roll
-- 3 yaw
-- 4 throttle
-- 5 collective
-- 6 left toe brake 
-- 7 right toe brake

local use_brakes = 1    -- set to 0 when only using helicopters with skids

-- functions start here ------------------------

function readPedals()
  local Diff = r_brake - l_brake
  if rudder ~= Diff then
    rudder = Diff
    if use_brakes == 0 then
      p_brake = 0.5       -- never release parking brakes
    end
  end
  if l_brake >= 0.7 then
    l_add=(l_brake - 0.7) / 2
  else
    l_add=0
  end
  if r_brake >= 0.7 then
    r_add=(r_brake - 0.7) / 2
  else
    r_add=0
  end
end

-- main starts here --------------------------

DataRef("p_brake", "sim/flightmodel/controls/parkbrake", "writeable")
DataRef("l_add", "sim/flightmodel/controls/l_brake_add", "writeable")
DataRef("r_add", "sim/flightmodel/controls/r_brake_add", "writeable")
DataRef("gear_ovr", "sim/operation/override/override_gearbrake", "writeable")
DataRef("toe_ovr", "sim/operation/override/override_toe_brakes", "writeable")
DataRef("rudder", "sim/joystick/yoke_heading_ratio", "writable")
DataRef("l_brake", "sim/joystick/joy_mapped_axis_value", "readonly", 6)
DataRef("r_brake", "sim/joystick/joy_mapped_axis_value", "readonly", 7)

p_brake=1
gear_ovr=1
toe_ovr=1

do_every_frame("readPedals()")


