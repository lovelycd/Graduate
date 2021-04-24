module Four_Snatcher_3_6(input D1,D2,D3,D4,Rd0,CLK,output Q1,Q2,Q3,Q4);
wire Q1N,Q2N,Q3N,Q4N;
wire CLK_Dir;
assign CLK_Dir=~(Q1N&Q2N&Q3N&Q4N&CLK);
D_Trigger_3_2    DT_32_1( 1,CLK_Dir,D1,Rd0,1, Q1,Q1N);
D_Trigger_3_2    DT_32_2( 1,CLK_Dir,D2,Rd0,1, Q2,Q2N);
D_Trigger_3_2    DT_32_3( 1,CLK_Dir,D3,Rd0,1, Q3,Q3N);
D_Trigger_3_2    DT_32_4( 1,CLK_Dir,D4,Rd0,1, Q4,Q4N);
endmodule 