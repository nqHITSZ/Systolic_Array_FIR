`timescale 1ns/10ps
module filter_tb;
localparam T=10;//100MHz
reg clk,reset;
reg [31:0] rom [100:0];
reg [31:0] original;
reg [15:0] i;


//generate 100MHz clock
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


filter u_filter
(
.clk(clk),
.rst(reset),
.original(original),
.filtered()
);    

always@(posedge clk)
	i=i+1;

always@*
begin
	original=rom[i];
end

initial
	begin
	i=0;
	$readmemh ("data.txt", rom);
    #(T*100)
    $stop;

	end


endmodule





