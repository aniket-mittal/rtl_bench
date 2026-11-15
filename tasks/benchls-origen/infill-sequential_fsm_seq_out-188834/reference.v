module origen_188834 (
    input run,
    input clk,
    input rst,
    output reg [3:0] out
);

    localparam S0 = 4'b0000;
    localparam S2 = 4'b0010;
    localparam S4 = 4'b0100;
    localparam S6 = 4'b0110;
    localparam S8 = 4'b1000;
    localparam S10 = 4'b1010;
    localparam S12 = 4'b1100;
    localparam S14 = 4'b1110;

    reg [3:0] current_state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= S0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            S0: begin
                if (run) begin
                    next_state = S2;
                end
                else begin
                    next_state = S0;
                end
                out = S0;
            end
            S2: begin
                if (run) begin
                    next_state = S4;
                end
                else begin
                    next_state = S2;
                end
                out = S2;
            end
            S4: begin
                if (run) begin
                    next_state = S6;
                end
                else begin
                    next_state = S4;
                end
                out = S4;
            end
            S6: begin
                if (run) begin
                    next_state = S8;
                end
                else begin
                    next_state = S6;
                end
                out = S6;
            end
            S8: begin
                if (run) begin
                    next_state = S10;
                end
                else begin
                    next_state = S8;
                end
                out = S8;
            end
            S10: begin
                if (run) begin
                    next_state = S12;
                end
                else begin
                    next_state = S10;
                end
                out = S10;
            end
            S12: begin
                if (run) begin
                    next_state = S14;
                end
                else begin
                    next_state = S12;
                end
                out = S12;
            end
            S14: begin
                if (run) begin
                    next_state = S0;
                end
                else begin
                    next_state = S14;
                end
                out = S14;
            end
            default: begin
                next_state = S0;
                out = S0;
            end
        endcase
    end

endmodule