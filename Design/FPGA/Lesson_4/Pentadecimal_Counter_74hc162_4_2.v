module Pentadecimal_Counter_74hc162_4_2(input CLK,output A0,A1,A2);
Decimal_Synchronous_Addition_Counter_74hc162_4_1    DSAC_162_41_1(~A2,1,CLK,1,1,0,0,0,0,A0,A1,A2);
endmodule 