module origen_005802(
    input wire clk,
    input wire start,
    input wire done,
    input wire [15:0] d_in,
    input wire [1:0] op_code,
    output reg finish,
    output reg ldA,
    output reg ldB,
    output reg ldO
);

    // State encoding
    parameter [3:0] s0 = 4'b0000,
                    s1 = 4'b0001,
                    s2 = 4'b0010,
                    s3 = 4'b0011,
                    s4 = 4'b0100,
                    s5 = 4'b0101,
                    s6 = 4'b0110,
                    s7 = 4'b0111,
                    s8 = 4'b1000;

    reg [3:0] state, next_state;

    // State transition logic
    always @(posedge clk) begin
        state <= next_state;
    end

    [MASKED]

    // Output logic
    always @(posedge clk) begin
        case(state)
            s0: begin
                ldA <= 0;
                ldB <= 0;
                ldO <= 0;
                finish <= 0;
            end
            s1: begin
                ldA <= 1;
                ldB <= 0;
                ldO <= 0;
                finish <= 0;
            end
            s2: begin
                ldA <= 0;
                ldB <= 1;
                ldO <= 0;
                finish <= 0;
            end
            s3: begin
                ldA <= 0;
                ldB <= 0;
                ldO <= 1;
                finish <= 0;
            end
            s4, s5, s6, s7: begin
                ldA <= 1;
                ldB <= 0;
                ldO <= 0;
                finish <= 0;
            end
            s8: begin
                ldA <= 0;
                ldB <= 0;
                ldO <= 0;
                finish <= done;
            end
            default: begin
                ldA <= 0;
                ldB <= 0;
                ldO <= 0;
                finish <= 0;
            end
        endcase
    end

endmodule