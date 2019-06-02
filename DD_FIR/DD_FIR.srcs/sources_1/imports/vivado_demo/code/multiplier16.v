module multiplier16(coef,di,prod);
    input[15:0] coef,di;
    output[15:0] prod;

    reg coef_sign,di_sign,prod_sign;
    reg[4:0] coef_exp,di_exp,prod_exp;
    reg[10:0] coef_mantissa,di_mantissa;
    reg[9:0] prod_mantissa;
    reg[21:0] tmp_prod; // product

    assign prod[15] = prod_sign;
	assign prod[14:10] = prod_exp;
	assign prod[9:0] = prod_mantissa[9:0];

    always @(*) begin
        coef_sign=coef[15];
        coef_exp=coef[14:10];
        coef_mantissa={1'b1,coef[9:0]};

        di_sign=di[15];
        di_exp=di[14:10];
        di_mantissa={1'b1,di[9:0]};

        // multiplication
        prod_sign = coef_sign ^ di_sign;
        prod_exp = coef_exp + di_exp - 15;
        tmp_prod = coef_mantissa * di_mantissa;

        // normalization
        if(tmp_prod[21]==1) begin
            prod_exp=prod_exp+1;
            tmp_prod = tmp_prod >> 1;
        end

        // rounding
        prod_mantissa=tmp_prod[20:10];
        if(tmp_prod[9]==1) begin
            prod_mantissa=prod_mantissa+1;
        end
    end

endmodule


