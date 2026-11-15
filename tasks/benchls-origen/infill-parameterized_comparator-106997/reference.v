module origen_106997 #(
    parameter ParamOpCode = "eq",
    parameter integer ParamBitWidth = 32
) (
    input wire clk,
    input wire enable,
    input wire [ParamBitWidth-1:0] lhs,
    input wire [ParamBitWidth-1:0] rhs,
    output wire ret
);

    reg ret_reg;
    reg ret_comb;

    generate
        if (ParamOpCode == "eq") begin
            always @(*) ret_comb = (lhs == rhs);
        end
        else if (ParamOpCode == "ne") begin
            always @(*) ret_comb = (lhs != rhs);
        end
        else if (ParamOpCode == "ugt") begin
            always @(*) ret_comb = (lhs > rhs);
        end
        else if (ParamOpCode == "uge") begin
            always @(*) ret_comb = (lhs >= rhs);
        end
        else if (ParamOpCode == "ult") begin
            always @(*) ret_comb = (lhs < rhs);
        end
        else if (ParamOpCode == "ule") begin
            always @(*) ret_comb = (lhs <= rhs);
        end
        else if (ParamOpCode == "sgt") begin
            always @(*) ret_comb = ($signed(lhs) > $signed(rhs));
        end
        else if (ParamOpCode == "sge") begin
            always @(*) ret_comb = ($signed(lhs) >= $signed(rhs));
        end
        else if (ParamOpCode == "slt") begin
            always @(*) ret_comb = ($signed(lhs) < $signed(rhs));
        end
        else if (ParamOpCode == "sle") begin
            always @(*) ret_comb = ($signed(lhs) <= $signed(rhs));
        end
        else begin
            // Default case or error handling can be added here
        end
    endgenerate

    assign ret = ret_comb;

endmodule