module origen_020889 (
    input wire clk,
    input wire rst,
    input wire cnvst,
    input wire cmp_out,
    output reg [7:0] sar,
    output reg eoc,
    output reg cmp_clk,
    output reg s_clk,
    output reg [15:0] fine_btm,
    output reg fine_switch_drain
);

    // State definitions
    localparam S_wait = 2'b00;
    localparam S_drain = 2'b01;
    localparam S_comprst = 2'b10;
    localparam S_decide = 2'b11;

    reg [1:0] state, next_state;
    reg [3:0] bit_counter;
    reg [4:0] drain_counter;
    reg [15:0] fine_btm_temp;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S_wait;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S_wait: next_state = cnvst ? S_drain : S_wait;
            S_drain: next_state = (drain_counter == 5'd31) ? S_comprst : S_drain;
            S_comprst: next_state = S_decide;
            S_decide: next_state = (bit_counter == 4'd8) ? S_wait : S_comprst;
            default: next_state = S_wait;
        endcase
    end

    // Output and internal register logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sar <= 8'b0;
            eoc <= 1'b0;
            cmp_clk <= 1'b0;
            s_clk <= 1'b0;
            fine_btm <= 16'b0;
            fine_switch_drain <= 1'b0;
            bit_counter <= 4'd0;
            drain_counter <= 5'd0;
            fine_btm_temp <= 16'b0;
        end else begin
            case (state)
                S_wait: begin
                    eoc <= 1'b0;
                    s_clk <= 1'b1;
                    cmp_clk <= 1'b0;
                    fine_switch_drain <= 1'b0;
                    bit_counter <= 4'd0;
                    drain_counter <= 5'd0;
                    if (cnvst) begin
                        sar <= 8'b10000000;
                        fine_btm <= 16'b1000000000000000;
                        fine_btm_temp <= 16'b1000000000000000;
                    end
                end
                S_drain: begin
                    s_clk <= 1'b0;
                    fine_switch_drain <= 1'b1;
                    drain_counter <= drain_counter + 1'b1;
                end
                S_comprst: begin
                    fine_switch_drain <= 1'b0;
                    cmp_clk <= 1'b1;
                end
                S_decide: begin
                    cmp_clk <= 1'b0;
                    if (cmp_out) begin
                        sar[7-bit_counter] <= 1'b1;
                        fine_btm <= fine_btm_temp | (16'b1 << (14-bit_counter));
                    end else begin
                        sar[7-bit_counter] <= 1'b0;
                        fine_btm <= fine_btm_temp & ~(16'b1 << (15-bit_counter));
                    end
                    fine_btm_temp <= fine_btm;
                    bit_counter <= bit_counter + 1'b1;
                    if (bit_counter == 4'd7) begin
                        eoc <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule