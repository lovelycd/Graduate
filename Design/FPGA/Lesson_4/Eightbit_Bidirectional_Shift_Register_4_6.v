module Eightbit_Bidirectional_Shift_Register_4_6(input En,CLK,CR0,S0,S1,DSL,DSR,D0,D1,D2,D3,D4,D5,D6,D7,output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7);
Fourbit_Bidirectional_Shift_Register_4_4      FBSR_44_1(En,CLK,CR0,S0,S1,Q4,DSR,D0,D1,D2,D3, Q0,Q1,Q2,Q3);
Fourbit_Bidirectional_Shift_Register_4_4      FBSR_44_2(En,CLK,CR0,S0,S1,DSL,Q3,D4,D5,D6,D7, Q4,Q5,Q6,Q7);
endmodule 