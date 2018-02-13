module process_element
(
input clk,rst,
input signed [31:0] w,x,d,
output signed [31:0] y,r

);
wire signed [31:0] w_1,w_2;
multiplier u_mult
( .a(w),
  .b(x),
  .result(w_1)
);


addr u_add
( .a(w_1),
  .b(w_2),
  .result(y)
);

DFF u_dff
( .clk(clk),
  .rst(rst),
  .d(d),
  .q(w_2)
);

assign r=x;

endmodule

module DFF
(
input clk,rst,
input signed[31:0] d,
output reg signed [31:0] q 
);
    
always@ (posedge clk, posedge rst)
    if(rst)
        q<=0;
    else
        q<=d;
endmodule

module addr
(
    input signed [31:0]a,b,
    output signed[31:0]result
);
assign result =  a+b;

endmodule

module multiplier
(
    input signed [31:0]a,b,
    output signed[31:0]result
);
assign result =  a*b;

endmodule

