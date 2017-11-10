# Long Exposure Photography
Written in VHDL

CREATED BY:

HARSHIT GOEL & ABHAY SAXENA

Indian Institute Of Technology Delhi

# BASIC CONCEPT
Persistence of Vision enables us to see the text in air when the LEDs are scrolled in a particular fashion

---------------------------------------------------------------------------------------
# BRIEF DESCRIPTION OF ALL THE ENTITIES

--> 1) Text Storage (only works in loading mode)

	•	This block contains LED pattern for every binary coded character (A-Z).
	•	It takes binary coded character as input from user.
	•	When Load is pressed, it retrieves the corresponding LED pattern from memory and stores it in a separate memory named 			Pattern.
	•	It also keeps track of the No. of alphabets stored in Pattern.
	•	It also passes the current alphabet being loaded to the display block.
	•	Display button is used to toggle between loading mode and LED output mode.
--> 2) Display Block

	•	This block has 2 modes : Loading mode and LED output mode.
	•	In loading mode, LEDs are kept off and it displays the current alphabet and total No. of alphabets on SSD (anode & 			cathode) using SSD clock.
	•	In LED output mode, the SSD is turned off and the LEDs start blinking according to the pattern provided by the text 			storage block, synchronized with LED clock.
	•	The signal LED outputs is mapped with 7 on-board LEDs.
--> 3) Clock setter

	•	This block uses the on-board clock and slows it down, using a counter, to produce 2 different clock, namely LED clock 			and SSD clock.
	•	Set Frequency is used to change the frequency of LED clock.

('reset' is just to start the whole system from a known base state which is empty memory and internal signals initialized)

-----------------------------------------------------------------------------
# How to run on board ?
1. Open Vivado and make a new project.
2. Add the design file (*.vhd or *.vhf) and the constraints file (*.xdc)
2. Generate BitStream
3. Open hardware manager and program the device (make sure that the device is connected)
4. Now the device should be ready! :)

# NOTE : 
1. While running on board, make sure to choose the frequency of LED output appropriately (the default is equal to the frequency of on-      board clock).
2. If you have any problem in generating the bitstream then use the *.bit file included in the repo to program the device.
3. For running simulation in vivado, make sure to change the value of 'mode' from '0'(default) to '1' inside the architecture of            TOP_LEVEL_ENTITY.

# Possible modifications in usage:
	1. Use external LEDs as the on-board LEDs are not much bright.
	2. The external LEDs can be attahced to a stick which can be mounted on a motor shaft and so the stick will rotate with the help 	    of motor, displaying the text in a circular fashion.
