module Decoder_74hc138_2_1(input   En,A0,A1,A2,S1,S2N,S3N,output Y0N,Y1N,Y2N,Y3N,Y4N,Y5N,Y6N,Y7N);
assign Y0N=~(S1&~S2N&~S3N&~A0&~A1&~A2&En);
assign Y1N=~(S1&~S2N&~S3N&A0&~A1&~A2&En);
assign Y2N=~(S1&~S2N&~S3N&~A0&A1&~A2&En);
assign Y3N=~(S1&~S2N&~S3N&A0&A1&~A2&En);
assign Y4N=~(S1&~S2N&~S3N&~A0&~A1&A2&En);
assign Y5N=~(S1&~S2N&~S3N&A0&~A1&A2&En);
assign Y6N=~(S1&~S2N&~S3N&~A0&A1&A2&En);
assign Y7N=~(S1&~S2N&~S3N&A0&A1&A2&En);
endmodule 