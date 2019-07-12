# VHDL Finite State Machine (FSM) (Artix-7 family Nexys 4 FPGA)
Creator: Ben Mighall

This program implements a three-state Finite State Machine (FSM) with the following details:

* STATE A
  * goes to state A on reset
  * first bit 0 -> State B
  * first bit 1 -> State C
  * second bit doesn't matter
* STATE B:
  * goes to state A on reset
  * on clock, goes to State C no matter what
* STATE C:
  * goes to state A on reset
  * first bit doesn't matter
  * second bit 1 -> State A
  * second bit 0 -> State C
  
Bits are determined by switches 1 and 0 respectively. Clock is a button.

This code was written as part of coursework for University of Mississippi class EL E 386 (Advanced Digital Systems Lab), and using an Artix-7 family Nexys 4 FPGA board. Constraints file is included in this repository.
