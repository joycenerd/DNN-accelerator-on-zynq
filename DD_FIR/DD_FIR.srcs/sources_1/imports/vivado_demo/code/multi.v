module multi(
	input wire clk,
	input wire [15:0] coef,	// in_a
	input wire [15:0] di,	// in_b
	output reg [31:0] prod	// out
);

	wire coef_sign,di_sign;
    wire[4:0] coef_exp,di_exp;
    wire[10:0] coef_mantissa,di_mantissa;

	reg prod_sign;
    reg[4:0] prod_exp;
    reg[10:0] prod_mantissa;

	reg[15:0] multi_coef,multi_di;
    wire[15:0] multi_prod;

	assign coef_sign=coef[15];
    assign coef_exp[4:0]=coef[14:10];
    assign coef_mantissa[10:0]={1'b1,coef[9:0]};

	assign di_sign=di[15];
    assign di_exp[4:0]=di[14:10];
    assign di_mantissa[10:0]={1'b1,di[9:0]};

	assign  prod[15] = prod_sign;
	assign  prod[14:10] = prod_exp;				
	assign  prod[9:0] = prod_mantissa[9:0];

	multiplier16 mpy(multi_coef,multi_di,multi_prod);

	always @ (*)
    begin
        // NaN * di = NaN, coef * NaN =NaN
        // NaN= exp=255 and fraction!=0
        if((coef_exp==31 && coef_mantissa[9:0]!=0) || (di_exp==31 && di_mantissa[9:0]!=0)) begin
            prod_sign <= 1;
            prod_exp <= 31;
            prod_mantissa[9] <= 1;
            prod_mantissa[8:0] <= 0;
        end
	
	// Inf=exp=255 and fraction=0
        // Inf * 0 = NaN
        else if(coef_exp==31) begin
            if(di_exp==0 && di_mantissa[9:0]==0) begin
                prod_sign <= 1;
                prod_exp <= 31;
                prod_mantissa[9] <=1;
                prod_mantissa[8:0] <= 0;
            end
            // Inf * di = Inf
            else begin
                prod_sign <= coef_sign ^ di_sign;
                prod_exp <= 31;
                prod_mantissa <= 0;
            end
        end

		// 0 * Inf = NaN
        else if(di_exp==31) begin
            if(coef_exp==0 && coef_mantissa[9:0]==0) begin
                prod_sign <= 1;
                prod_exp <= 31;
                prod_mantissa[9] <=1;
                prod_mantissa[8:0] <= 0;
            end
            // coef * Inf = Nan
            else begin
                prod_sign <= coef_sign ^ di_sign;
                prod_exp <= 31;
                prod_mantissa <= 0;
            end
        end

		// coef * 0 = 0
        else if(di_exp==0 && di_mantissa[9:0]==0) begin
            prod_sign <= 0;
            prod_exp <= 0;
            prod_mantissa <= 0;
        end

        // 0 * di = 0
        else if(coef_exp==0 && coef_mantissa[9:0]==0) begin
            prod_sign <= 0;
            prod_exp <= 0;
            prod_mantissa <= 0;
        end

		else begin
            multi_coef <= coef;
            multi_di <= di;
            //multiplier16 mpy(multiplyin_a[15:0],multiplyin_b[15:0],multiply_out[15:0]);
            prod_sign=multi_prod[15];
            prod_exp=multi_prod[14:10];
            prod_mantissa=multi_prod[9:0];
        end		

    end

	/*always @(posedge clk) begin
		prod <= coef * di; 
	end*/
	
endmodule
