module Coder_8_3_74hc151_2_7(input En,S0,A0,A1,A2,D0,D1,D2,D3,D4,D5,D6,D7,output Y,Y0);
wire temp;
assign temp=  ~A0&~A1&~A2&D0  |  A0&~A1&~A2&D1  |  ~A0&A1&~A2&D2 |   A0&A1&~A2&D3 |  ~A0&~A1&A2&D4  |  A0&~A1&A2&D5  |  ~A0&A1&A2&D6 |  A0&A1&A2&D7;   
assign Y=temp&~S0&En;
assign Y0=~temp&~S0&En;
endmodule 

