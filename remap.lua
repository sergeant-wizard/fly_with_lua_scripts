xbox = 160
debug_string = ""

function debug()
	draw_string( 30, 300, debug_string, "red" )
end

do_every_draw('debug()')

-- set("sim/joystick/joystick_pitch_nullzone", 0.2)

function setup_common()
	clear_all_button_assignments()
	-- A
	set_button_assignment(xbox + 0, "sim/engines/throttle_up")
	-- B
	set_button_assignment(xbox + 1, "sim/engines/throttle_down")
	-- X
	-- Y
	set_button_assignment(xbox + 3, "sim/flight_controls/brakes_max")
	-- LB
	set_button_assignment(xbox + 4, "sim/flight_controls/rudder_trim_left")
	-- set_button_assignment(xbox + 4, "sim/engines/mixture_down")
	-- RB
	set_button_assignment(xbox + 5, "sim/flight_controls/rudder_trim_right")
	-- set_button_assignment(xbox + 5, "sim/engines/mixture_up")
	-- window
	set_button_assignment(xbox + 6, "sim/autopilot/servos_toggle")
	-- menu
	set_button_assignment(xbox + 7, "sim/operation/pause_toggle")
    -- L3
	set_button_assignment(xbox + 8, "sim/electrical/batteries_toggle")
	-- R3
    -- UP
	set_button_assignment(xbox + 16, "sim/flight_controls/pitch_trim_down")
    -- RIGHT
	set_button_assignment(xbox + 18, "sim/flight_controls/aileron_trim_right")
	-- set_button_assignment(xbox + 18, "sim/engines/prop_up")
    -- DOWN
	set_button_assignment(xbox + 20, "sim/flight_controls/pitch_trim_up")
    -- LEFT
	-- set_button_assignment(xbox + 22, "sim/engines/prop_down")
	set_button_assignment(xbox + 22, "sim/flight_controls/aileron_trim_left")
end

function left_engine_only()
	set_button_assignment(xbox + 0, "sim/engines/throttle_up_1")
	set_button_assignment(xbox + 1, "sim/engines/throttle_down_1")
	-- set_button_assignment(xbox + 4, "sim/engines/mixture_down_1")
	-- set_button_assignment(xbox + 5, "sim/engines/mixture_up_1")
	-- set_button_assignment(xbox + 18, "sim/engines/prop_up_1")
	-- set_button_assignment(xbox + 22, "sim/engines/prop_down_1")
end

function right_engine_only()
	set_button_assignment(xbox + 0, "sim/engines/throttle_up_2")
	set_button_assignment(xbox + 1, "sim/engines/throttle_down_2")
	-- set_button_assignment(xbox + 4, "sim/engines/mixture_down_2")
	-- set_button_assignment(xbox + 5, "sim/engines/mixture_up_2")
	-- set_button_assignment(xbox + 18, "sim/engines/prop_up_2")
	-- set_button_assignment(xbox + 22, "sim/engines/prop_down_2")
end

function on_key_pressed()
	if CKEY == ";" then
		debug_string = "left engine"
		left_engine_only()
	end
	if CKEY == "q" then
		debug_string = "both engines"
		setup_common()
	end
	if CKEY == "j" then
		debug_string = "right engine"
		right_engine_only()
	end
end

if PLANE_ICAO == "C172" then
	draw_string( 100, 400, "C172", "red" )
end
if  PLANE_ICAO == "BE58" or PLANE_ICAO == "PA44" or PLANE_ICAO == "PA44-180" then
	setup_common()
	do_on_keystroke("on_key_pressed()")
	create_positive_edge_flip(
		320, 
		"sim/flightmodel/engine/ENGN_prop",
		0,
		0,
		100
	)
	create_positive_edge_flip(
		322, 
		"sim/flightmodel/engine/ENGN_prop",
		1,
		0,
		100
	)
end