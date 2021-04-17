module Circular_Shifter_74hc194_4_5(input CLK,S0,S1,D0,D1,D2,D3,output Q0,Q1,Q2,Q3);
Fourbit_Bidirectional_Shift_Register_4_4   FBSR_44_1(1,CLK,S0,S1,0,Q3,D0,D1,D2,D3,Q0,Q1,Q2,Q3);
endmodule 