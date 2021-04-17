module RS_Trigger_3_1(En,R,S,Q,Q0);
input En,R,S;
output Q,Q0;
wire temp_Q0;
wire temp_Q;
nand n1(Q,S,temp_Q0);
nand n2(Q0,R,temp_Q);
assign Q0=temp_Q0&En;
assign Q=temp_Q&En;
endmodule 