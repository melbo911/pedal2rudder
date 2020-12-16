--
-- left/right racing pedals to rudder/heading mapper
--
-- version 1.0 - 20201215 - melbo @x-plane.org
--

-- axis types
-- 1 pitch
-- 2 roll
-- 3 yaw
-- 4 throttle
-- 5 collective
-- 6 left toe brake 
-- 7 right toe brake

local use_brakes = 0    -- set to 0 when using helicopters with skids
local left_axis  = 0
local right_axis = 0

-- functions start here ------------------------

function readAxisTypes()
  local axis_type

  for i = 0, 499 do
    -- get axis types 
    axis_type = get( "sim/joystick/joystick_axis_assignments", i )
    if axis_type == 6 then     -- left brake pedal ?
      left_axis = i
    elseif axis_type == 7 then   -- right brake pedal ?
      right_axis = i
    end 
  end
end

function readPedals()
  local Diff = left_brake - right_brake
  if rudder ~= Diff then
    rudder = Diff
    if use_brakes == 0 then
      brake = 0.5       -- do not release brakes
    end
  end
end

-- main starts here --------------------------

readAxisTypes()

if left_axis == 0 or right_axis == 0 then
  XPLMSpeakString("no brake axis defined") 
else
  DataRef("brake", "sim/flightmodel/controls/parkbrake", "writeable")
  DataRef("rudder", "sim/joystick/yoke_heading_ratio", "writable")
  DataRef("left_brake", "sim/joystick/joystick_axis_values", "readonly", left_axis)
  DataRef("right_brake", "sim/joystick/joystick_axis_values", "readonly", right_axis)
  XPLMSpeakString("brake axis mapped to rudder") 

  do_every_frame("readPedals()")
end

