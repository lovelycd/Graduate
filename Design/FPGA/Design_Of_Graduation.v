module Design_Of_Graduation(tclk,RXD,DATA_R ,key_input,intr_rcive,logic_output,led_output);

input tclk,RXD;
input [15:0] key_input;
output  [7:0] DATA_R;
output intr_rcive;												// uart byte receive interrupt bit  
output reg[7:0] led_output=0;
output reg [15:0] logic_output=0;					//led output
 
reg  [2:0] n_byte=0; 
reg [15:0] logic_input;		//labview input
reg [7:0] exp_selc;		//experiment select code
reg trans_finish=0; 					//the siginal of the whole command  receive finish
wire En_11,En_12,En_13,En_14,En_15;
wire En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29;
wire En_31,En_32,En_33,En_34,En_35,En_36;
wire En_41,En_42,En_43,En_44,En_45,En_46;								//the enable bit of every single experiment
reg En_Key=0;																										//enable the key input or labview iniput
wire [15:0] Reality_input;																				//the function module real input

UART_R wesdfgh(tclk,115200,RXD,DATA_R,intr_rcive);			//uart receive data module 

Real_input  realinput1(En_Key,key_input[15:0],logic_input[15:0],Reality_input[15:0]);

expe_select expe_select1(exp_selc[7:0],En_11,En_12,En_13,En_14,En_15,
				En_21,En_22,En_23,En_24,En_25,En_26,En_27,En_28,En_29,
				En_31,En_32,En_33,En_34,En_35,En_36,
				En_41,En_42,En_43,En_44,En_45,En_46);									//enable corresponding experiment based on the command byte
				

				
always @(posedge intr_rcive) begin													// wait for the finish of uart receivement
	   case(n_byte)
			3'b000:	if(DATA_R!=8'hAA) n_byte=0;else begin  n_byte=n_byte+1;trans_finish=0;end
			3'b001:	begin exp_selc=DATA_R;n_byte=n_byte+1; end
			3'b010:	if(DATA_R==8'h55) begin n_byte=0;En_Key=1; trans_finish=1; end  else  begin logic_input[15:8]=DATA_R;n_byte=n_byte+1;end
			3'b011:	begin En_Key=0;logic_input[7:0]=DATA_R;n_byte=n_byte+1;end
			3'b100:   if(DATA_R==8'h55) begin n_byte=0;trans_finish=1;end else n_byte=0; 
			default : n_byte=0;
		endcase
end

wire output_1_11;
And_Not_Gate_1_1 AndNotGate1(En_11,Reality_input[0],Reality_input[1],output_1_11);
wire output_1_12,output_2_12;
Semi_Adder_1_2 SemiAdder1(En_12,Reality_input[0],Reality_input[1],output_1_12,output_2_12);
wire output_1_13,output_2_13,output_3_13;
Full_Adder_1_3 FullAdder1(En_13,Reality_input[0],Reality_input[1],Reality_input[2],output_1_13,output_2_13);
wire output_1_14;
Fire_Alarm_System_1_4 FireAlarmSystem1(En_14,Reality_input[0],Reality_input[1],Reality_input[2],output_1_14);
wire output_1_15;
Four_Vote_1_5 FourVote1(En_15,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],output_1_15);
wire output_1_21,output_2_21,output_3_21,output_4_21,output_5_21,output_6_21,output_7_21,output_8_21;
Decoder_74hc138_2_1 Decoder74hc1381(En_21,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],
																							output_1_21,output_2_21,output_3_21,output_4_21,output_5_21,output_6_21,output_7_21,output_8_21);
wire output_1_22;
Led_74ls138_2_2 Led74ls1381(En_22,Reality_input[0],Reality_input[1],Reality_input[2],output_1_22);
wire output_1_23,output_2_23;
Dual_MUX_74hc173_2_3 DualMUX74hc173(En_23,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],Reality_input[6],
																								Reality_input[7],Reality_input[8],Reality_input[9],Reality_input[10],Reality_input[11],output_1_23,output_2_23);
wire output_1_24;
MUX_8_1_2_4 MUX81241(En_24,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],Reality_input[6],
																								Reality_input[7],Reality_input[8],Reality_input[9],Reality_input[10],output_1_24);
wire output_1_25,output_2_25;
Full_Adder_74hc153_2_5   FullAdder2(En_25,Reality_input[0],Reality_input[1],Reality_input[2],output_1_25,output_2_25);
wire output_1_26,output_2_26,output_3_26,output_4_26,output_5_26,output_6_26,output_7_26,output_8_26;
Digital_Tube_Decoder_2_6 DigitalTubeDecoder1(En_26,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],output_1_26,
																									output_2_26,output_3_26,output_4_26,output_5_26,output_6_26,output_7_26,output_8_26);
wire output_1_27,output_2_27;
Coder_8_3_74hc151_2_7  Coder837hc1511(En_27,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],Reality_input[6],
																								Reality_input[7],Reality_input[8],Reality_input[9],Reality_input[10],Reality_input[11],output_1_27,output_2_27);
wire output_1_28;
Four_Vote_74hc151_2_8 FourVote74hc151281(En_28,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],output_1_28);
wire output_1_29,output_2_29,output_3_29,output_4_29,output_5_29,output_6_29,output_7_29,output_8_29;
Decode_Display_2_9 DecoderDisplay1(En_29,Reality_input[0],Reality_input[1],output_1_29,output_2_29,output_3_29,output_4_29,output_5_29,output_6_29,output_7_29,output_8_29);
wire output_1_31,output_2_31;
RS_Trigger_3_1 RSTrigger1(En_31,Reality_input[0],Reality_input[1],output_1_31,output_2_31);
wire output_1_32,output_2_32;
D_Trigger_3_2 DTrigger1(En_32,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],output_1_32,output_2_32);
wire output_1_33,output_2_33;
CrossOver_24_D_3_3 CrossOver24d1(En_33,Reality_input[0],output_1_33,output_2_33);
wire output_1_34,output_2_34;
JK_Trigger_3_4 JKTrigger1(En_34,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],output_1_34,output_2_34);
wire output_1_35,output_2_35;
CrossOver_24_JK_3_5 CrossOver24JK1(En_35,Reality_input[0],output_1_35,output_2_35);
wire output_1_36,output_2_36,output_3_36,output_4_36;
Four_Snatcher_3_6 FourSnatcher1(En_36,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],tclk,output_1_36,output_2_36,output_3_36,output_4_36);
wire output_1_41,output_2_41,output_3_41,output_4_41,output_5_41;
Decimal_Synchronous_Addition_Counter_74hc162_4_1  DecimalSynchronousAdditonCounter1(En_41,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],
																														Reality_input[6],Reality_input[7],Reality_input[8],output_1_41,output_2_41,output_3_41,output_4_41,output_5_41);
wire output_1_42,output_2_42,output_3_42;
Pentadecimal_Counter_74hc162_4_2 PentadecimalCounter1(En_42,Reality_input[0],output_1_42,output_2_42,output_3_42);
wire output_1_43,output_2_43,output_3_43,output_4_43,output_5_43,output_6_43;
Counter_24_74hc162_4_3  Counter2474hc1621(En_43,Reality_input[0],output_1_43,output_2_43,output_3_43,output_4_43,output_5_43,output_6_43);

wire output_1_44,output_2_44,output_3_44,output_4_44;
Fourbit_Bidirectional_Shift_Register_4_4 FourbitBidirectionalShiftRegister1(En_44,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],Reality_input[6],
																								Reality_input[7],Reality_input[8],Reality_input[9],output_1_44,output_2_44,output_3_44,output_4_44);
wire output_1_45,output_2_45,output_3_45,output_4_45;
Circular_Shifter_74hc194_4_5  CircularShifter1(En_45,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],Reality_input[4],Reality_input[5],
																											Reality_input[6],output_1_45,output_2_45,output_3_45,output_4_45);
wire output_1_46,output_2_46,output_3_46,output_4_46,output_5_46,output_6_46,output_7_46,output_8_46;
Eightbit_Bidirectional_Shift_Register_4_6  EightbitBidirectionalShiftRegister1(En_46,Reality_input[0],Reality_input[1],Reality_input[2],Reality_input[3],
																								Reality_input[4],Reality_input[5],Reality_input[6],Reality_input[7],Reality_input[8],
																								Reality_input[9],Reality_input[10],Reality_input[11],Reality_input[12],Reality_input[13],
																								output_1_46,output_2_46,output_3_46,output_4_46,output_5_46,output_6_46,output_7_46,output_8_46);
																		
																								
																								
																								
always @(posedge trans_finish)
		case(exp_selc)
			8'h11:  begin logic_output[0]=output_1_11;              end
			8'h12: begin logic_output[0]=output_1_12; logic_output[1]=output_2_12;  end
			8'h13: begin logic_output[0]=output_1_13;logic_output[1]=output_2_13;end
			8'h14: begin logic_output[0]=output_1_14;end
			8'h15: begin logic_output[0]=output_1_15;end
			8'h21: begin logic_output[0]=output_1_21;logic_output[1]=output_2_21;logic_output[2]=output_3_21;logic_output[3]=output_4_21;
									  logic_output[4]=output_5_21;logic_output[5]=output_6_21;logic_output[6]=output_7_21;logic_output[7]=output_8_21;end
			8'h22:begin logic_output[0]=output_1_22;end
			8'h23:begin logic_output[0]=output_1_23;logic_output[1]=output_2_23;end
			8'h24:begin logic_output[0]=output_1_24;end
			8'h25:begin logic_output[0]=output_1_25;logic_output[1]=output_2_25;end
			8'h26:begin led_output[0]=output_1_26;led_output[1]=output_2_26;led_output[2]=output_3_26;led_output[3]=output_4_26;
									 led_output[4]=output_5_26;led_output[5]=output_6_26;led_output[6]=output_7_26;led_output[7]=output_8_26;end
			8'h27:begin logic_output[0]=output_1_27;end
			8'h28:begin logic_output[0]=output_1_28;end
			8'h29:begin led_output[0]=output_1_29;led_output[1]=output_2_29;led_output[2]=output_3_29;led_output[3]=output_4_29;
									 led_output[4]=output_5_29;led_output[5]=output_6_29;led_output[6]=output_7_29;led_output[7]=output_8_29;end
			8'h31:begin logic_output[0]=output_1_31;logic_output[1]=output_2_31;end
			8'h32:begin logic_output[0]=output_1_32;logic_output[1]=output_2_32;end
			8'h33:begin logic_output[0]=output_1_33;logic_output[1]=output_2_33;end
			8'h34:begin logic_output[0]=output_1_34;logic_output[1]=output_2_34;end
			8'h35:begin logic_output[0]=output_1_35;logic_output[1]=output_2_35;end
			8'h36:begin logic_output[0]=output_1_36;logic_output[1]=output_2_36;logic_output[2]=output_3_36;logic_output[3]=output_4_36;end
			8'h41:begin logic_output[0]=output_1_41;logic_output[1]=output_2_41;logic_output[2]=output_3_41;logic_output[3]=output_4_41;logic_output[4]=output_5_41;end
			8'h42:begin logic_output[0]=output_1_42;logic_output[1]=output_2_42;logic_output[2]=output_3_42;end
			8'h43:begin logic_output[0]=output_1_43;logic_output[1]=output_2_43;logic_output[2]=output_3_43;logic_output[3]=output_4_43;
																									 logic_output[4]=output_5_43;logic_output[5]=output_6_43;end
			
			
			
			8'h44:begin logic_output[0]=output_1_44;logic_output[1]=output_2_44;logic_output[2]=output_3_44;logic_output[3]=output_4_44;end
			8'h45:begin logic_output[0]=output_1_45;logic_output[1]=output_2_45;logic_output[2]=output_3_45;logic_output[3]=output_4_45;end
			8'h46:begin logic_output[0]=output_1_46;logic_output[1]=output_2_46;logic_output[2]=output_3_46;logic_output[3]=output_4_46;
									 logic_output[4]=output_5_46;logic_output[5]=output_6_46;logic_output[6]=output_7_46;logic_output[7]=output_8_46;end
			
			
			endcase

endmodule 