module filter
(
input clk,rst,
input signed [31:0] original,
output signed [31:0] filtered

);
localparam w0=4,w1=18,w2=47,w3=62,w4=47,w5=18,w6=4;
wire signed [31:0] right[7:0];
wire signed [31:0] y_out[7:0];
wire signed [31:0] w[6:0];

assign w[00] = w0;
assign w[01] = w1;
assign w[02] = w2;
assign w[03] = w3;
assign w[04] = w4;
assign w[05] = w5;
assign w[06] = w6;

assign right[0]=original;
assign filtered=y_out[0];
assign y_out[7]=0;

genvar i;
generate
for (i=0; i<=6; i=i+1)
    begin: pe
			process_element pe
			(
			.clk(clk),
			.rst(reset),
			.w(w[i]),
			.x(right[i]),
			.d(y_out[i+1]),
			.y(y_out[i]),
			.r(right[i+1])
			);
    end
endgenerate

endmodule


