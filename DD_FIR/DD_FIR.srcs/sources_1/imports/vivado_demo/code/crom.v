module crom(
	input wire clk, 
	input wire [3:0] cidx, 
	output reg [15:0] coef
);
	parameter coefficent00 = 16'b0000_0000_0000_0001; //1
	parameter coefficent01 = 16'b0000_0000_0000_0010;
	parameter coefficent02 = 16'b0000_0000_0000_0011;
	parameter coefficent03 = 16'b0000_0000_0000_0100;
	parameter coefficent04 = 16'b0000_0000_0000_0101; //5
	parameter coefficent05 = 16'b0000_0000_0000_0100;
	parameter coefficent06 = 16'b0000_0000_0000_0011;
	parameter coefficent07 = 16'b0000_0000_0000_0010;
	parameter coefficent08 = 16'b0000_0000_0000_0001; //1
	parameter coefficent09 = 16'b0000_0000_0000_0000;
	parameter coefficent10 = 16'b0000_0000_0000_0000;
	parameter coefficent11 = 16'b0000_0000_0000_0000;
	parameter coefficent12 = 16'b0000_0000_0000_0000;
	parameter coefficent13 = 16'b0000_0000_0000_0000;
	parameter coefficent14 = 16'b0000_0000_0000_0000;
	parameter coefficent15 = 16'b0000_0000_0000_0000;
	
	always @(posedge clk)begin
		case (cidx)
			4'b0000: coef <= coefficent00;
			4'b0001: coef <= coefficent01;
			4'b0010: coef <= coefficent02;
			4'b0011: coef <= coefficent03;
			4'b0100: coef <= coefficent04;
			4'b0101: coef <= coefficent05;
			4'b0110: coef <= coefficent06;
			4'b0111: coef <= coefficent07;
			4'b1000: coef <= coefficent08;
			4'b1001: coef <= coefficent09;
			4'b1010: coef <= coefficent10;
			4'b1011: coef <= coefficent11;
			4'b1100: coef <= coefficent12;
			4'b1101: coef <= coefficent13;
			4'b1110: coef <= coefficent14;
			4'b1111: coef <= coefficent15;
		endcase
	end
	
endmodule

