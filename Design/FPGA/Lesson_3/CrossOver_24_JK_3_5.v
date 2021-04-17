module CrossOver_24_JK_3_5(input CLK,output Q1,Q2);
wire temp_Q00,temp_Q10;


JK_Trigger_3_4    JKT_34_1(1,CLK,temp_Q00,~temp_Q00,1,1,Q1,temp_Q00);
JK_Trigger_3_4    JKT_34_2(1,Q1,temp_Q10,~temp_Q10,1,1,Q2,temp_Q10);



endmodule 