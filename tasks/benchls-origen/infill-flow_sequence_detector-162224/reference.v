module origen_162224(
    input clk,
    input rst_n,
    input [7:0] cap_flow,
    input [7:0] low_flow,
    output reg [7:0] out_flow
);

reg [3:0] CS;

parameter S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5,
          S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, S9 = 4'd9, S10 = 4'd10, S11 = 4'd11;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        CS <= S0;
        out_flow <= 8'h00;
    end
    else begin
        case (CS)
            S0: begin
                if (cap_flow == 8'h49 && low_flow == 8'h6c) begin
                    CS <= S1;
                    out_flow <= 8'h49;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S1: begin
                if (cap_flow == 8'h4c && low_flow == 8'h6f) begin
                    CS <= S2;
                    out_flow <= 8'h6c;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S2: begin
                if (cap_flow == 8'h4c && low_flow == 8'h6f) begin
                    CS <= S3;
                    out_flow <= 8'h6f;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S3: begin
                if (cap_flow == 8'h56 && low_flow == 8'h65) begin
                    CS <= S4;
                    out_flow <= 8'h76;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S4: begin
                if (cap_flow == 8'h45 && low_flow == 8'h20) begin
                    CS <= S5;
                    out_flow <= 8'h65;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S5: begin
                if (cap_flow == 8'h59 && low_flow == 8'h6f) begin
                    CS <= S6;
                    out_flow <= 8'h79;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S6: begin
                if (cap_flow == 8'h4f && low_flow == 8'h75) begin
                    CS <= S7;
                    out_flow <= 8'h6f;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S7: begin
                if (cap_flow == 8'h21 && low_flow == 8'h00) begin
                    CS <= S8;
                    out_flow <= 8'h21;
                end
                else begin
                    CS <= S0;
                    out_flow <= 8'h00;
                end
            end
            S8: begin
                CS <= S9;
                out_flow <= 8'h00;
            end
            S9: begin
                CS <= S10;
                out_flow <= 8'h00;
            end
            S10: begin
                CS <= S11;
                out_flow <= 8'h00;
            end
            S11: begin
                CS <= S0;
                out_flow <= 8'h00;
            end
            default: begin
                CS <= S0;
                out_flow <= 8'h00;
            end
        endcase
    end
end

endmodule