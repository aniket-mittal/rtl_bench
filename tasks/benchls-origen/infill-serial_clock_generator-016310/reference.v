module origen_016310 #(
    parameter WIDTH = 8,
    parameter CNT_WIDTH = 4,
    parameter DIV_WIDTH = 4,
    parameter COUNT_WIDTH = 16
) (
    input wire clk_in,
    input wire rst,
    input wire [CNT_WIDTH-1:0] count,
    input wire start,
    input wire start_tmp,
    input wire [DIV_WIDTH-1:0] div,
    input wire [COUNT_WIDTH-1:0] counter,
    output reg clk_sr
);

    // FSM states
    localparam s0 = 1'b0;
    localparam s1 = 1'b1;

    reg state, next_state;

    // State transition logic
    always @(posedge clk_in or posedge rst) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            s0: next_state = (!start && start_tmp) ? s1 : s0;
            s1: next_state = (count == WIDTH + 1) ? s0 : s1;
            default: next_state = s0;
        endcase
    end

    // Output logic
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            clk_sr <= 1'b1;
        end else begin
            case (state)
                s0: clk_sr <= 1'b1;
                s1: clk_sr <= ~counter[div-1];
                default: clk_sr <= 1'b1;
            endcase
        end
    end

endmodule