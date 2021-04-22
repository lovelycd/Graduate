module Real_input(input En_key,input [15:0] Key_input,input [15:0] Logic_input,output [15:0] Rea_input);
assign Rea_input[0]=(En_key&Key_input[0])  | (~En_key&Logic_input[0]);
assign Rea_input[1]=(En_key&Key_input[1])  | (~En_key&Logic_input[1]);
assign Rea_input[2]=(En_key&Key_input[2])  | (~En_key&Logic_input[2]);
assign Rea_input[3]=(En_key&Key_input[3])  | (~En_key&Logic_input[3]);
assign Rea_input[4]=(En_key&Key_input[4])  | (~En_key&Logic_input[4]);
assign Rea_input[5]=(En_key&Key_input[5])  | (~En_key&Logic_input[5]);
assign Rea_input[6]=(En_key&Key_input[6])  | (~En_key&Logic_input[6]);
assign Rea_input[7]=(En_key&Key_input[7])  | (~En_key&Logic_input[7]);
assign Rea_input[8]=(En_key&Key_input[8])  | (~En_key&Logic_input[8]);
assign Rea_input[9]=(En_key&Key_input[9])  | (~En_key&Logic_input[9]);
assign Rea_input[10]=(En_key&Key_input[10])  | (~En_key&Logic_input[10]);
assign Rea_input[11]=(En_key&Key_input[11])  | (~En_key&Logic_input[11]);
assign Rea_input[12]=(En_key&Key_input[12])  | (~En_key&Logic_input[12]);
assign Rea_input[13]=(En_key&Key_input[13])  | (~En_key&Logic_input[13]);
assign Rea_input[14]=(En_key&Key_input[14])  | (~En_key&Logic_input[14]);
assign Rea_input[15]=(En_key&Key_input[15])  | (~En_key&Logic_input[15]);                             
endmodule 