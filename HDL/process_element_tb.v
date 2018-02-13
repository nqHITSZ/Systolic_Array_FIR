`timescale 1ns/10ps
module process_element_tb;
localparam T=10;//100MHz
reg clk,reset;
reg signed [31:0]w,x,d;


//generate 50MHz clock
initial
	begin
		clk=0;
		forever clk=#(T/2)~clk;
	end
//reset for the first half cycle
initial
	begin
		reset=1;#(T*1.6)
		reset=0;
	end


process_element u_pe
(
.clk(clk),
.rst(reset),
.w(w),
.x(x),
.d(d)
);

initial
	begin
    x=-150;
    w=22;
    d=69;
    #(T*100)
    $stop;

	end


endmodule


