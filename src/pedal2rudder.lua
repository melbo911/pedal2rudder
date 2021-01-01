--
-- left/right racing pedals to rudder/heading mapper
--
-- version 1.1 - 20210101 - melbo @x-plane.org
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

local axis_type = dataref_table("sim/joystick/joystick_axis_assignments")
local axis_values = dataref_table("sim/joystick/joystick_axis_values")
local brake = dataref_table("sim/flightmodel/controls/parkbrake")
local rudder = dataref_table("sim/joystick/yoke_heading_ratio")

-- functions start here ------------------------

function readAxisTypes()
  for i = 0, 499 do
    if axis_type[i] == 6 then     -- left brake pedal ?
      left_axis = i
    else
      if axis_type[i] == 7 then   -- right brake pedal ?
        right_axis = i
      end
    end 
  end
end

function readPedals()
  local Diff = axis_values[left_axis] - axis_values[right_axis]
  if rudder[0] ~= Diff then
    rudder[0] = Diff
    if use_brakes == 0 then
      brake[0] = 0.5       -- do not release breaks
    end
  end
end

-- main starts here --------------------------

readAxisTypes()

if left_axis == 0 or right_axis == 0 then
  XPLMSpeakString("no brake axis defined") 
else
  -- XPLMSpeakString("brake axis mapped to rudder") 
  do_every_frame("readPedals()")
end

