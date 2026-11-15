module origen_214792 (
    input Data_in,
    input [2:0] sel,
    output reg Data_out_0,
    output reg Data_out_1,
    output reg Data_out_2,
    output reg Data_out_3,
    output reg Data_out_4,
    output reg Data_out_5,
    output reg Data_out_6,
    output reg Data_out_7
);

always @* begin
    case (sel)
        3'b000: begin
            Data_out_0 = Data_in;
            Data_out_1 = 1'b0;
            Data_out_2 = 1'b0;
            Data_out_3 = 1'b0;
            Data_out_4 = 1'b0;
            Data_out_5 = 1'b0;
            Data_out_6 = 1'b0;
            Data_out_7 = 1'b0;
        end
        3'b001: begin
            Data_out_0 = 1'b0;
            Data_out_1 = Data_in;
            Data_out_2 = 1'b0;
            Data_out_3 = 1'b0;
            Data_out_4 = 1'b0;
            Data_out_5 = 1'b0;
            Data_out_6 = 1'b0;
            Data_out_7 = 1'b0;
        end
        3'b010: begin
            Data_out_0 = 1'b0;
            Data_out_1 = 1'b0;
            Data_out_2 = Data_in;
            Data_out_3 = 1'b0;
            Data_out_4 = 1'b0;
            Data_out_5 = 1'b0;
            Data_out_6 = 1'b0;
            Data_out_7 = 1'b0;
        end
        3'b011: begin
            Data_out_0 = 1'b0;
            Data_out_1 = 1'b0;
            Data_out_2 = 1'b0;
            Data_out_3 = Data_in;
            Data_out_4 = 1'b0;
            Data_out_5 = 1'b0;
            Data_out_6 = 1'b0;
            Data_out_7 = 1'b0;
        end
        3'b100: begin
            Data_out_0 = 1'b0;
            Data_out_1 = 1'b0;
            Data_out_2 = 1'b0;
            Data_out_3 = 1'b0;
            Data_out_4 = Data_in;
            Data_out_5 = 1'b0;
            Data_out_6 = 1'b0;
            Data_out_7 = 1'b0;
        end
        3'b101: begin
            Data_out_0 = 1'b0;
            Data_out_1 = 1'b0;
            Data_out_2 = 1'b0;
            Data_out_3 = 1'b0;
            Data_out_4 = 1'b0;
            Data_out_5 = Data_in;
            Data_out_6 = 1'b0;
            Data_out_7 = 1'b0;
        end
        3'b110: begin
            Data_out_0 = 1'b0;
            Data_out_1 = 1'b0;
            Data_out_2 = 1'b0;
            Data_out_3 = 1'b0;
            Data_out_4 = 1'b0;
            Data_out_5 = 1'b0;
            Data_out_6 = Data_in;
            Data_out_7 = 1'b0;
        end
        3'b111: begin
            Data_out_0 = 1'b0;
            Data_out_1 = 1'b0;
            Data_out_2 = 1'b0;
            Data_out_3 = 1'b0;
            Data_out_4 = 1'b0;
            Data_out_5 = 1'b0;
            Data_out_6 = 1'b0;
            Data_out_7 = Data_in;
        end
    endcase
end

endmodule