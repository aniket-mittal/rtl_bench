module origen_139492 #(
    parameter N = 8
)(
    input wire clk,
    input wire rst,
    input wire start,
    input wire [15:0] in1, in2, in3, in4, in5, in6, in7, in8,
    output reg [15:0] out1, out2, out3, out4, out5, out6, out7, out8,
    output reg done
);

    // Internal signals
    reg [15:0] dct_coeffs [0:N-1];
    reg [15:0] idct_outputs [0:N-1];
    reg [2:0] state;
    reg [3:0] counter;

    // Constants for DCT/IDCT calculations
    localparam real PI = 3.14159265358979323846;
    wire [15:0] c [0:N-1];

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : coeff_gen
            assign c[i] = $rtoi(16384.0 * $cos((2*i + 1) * PI / (2*N)));
        end
    endgenerate

    // State machine states
    localparam IDLE = 3'd0, DCT = 3'd1, IDCT = 3'd2, DONE = 3'd3;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            counter <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= DCT;
                        counter <= 0;
                    end
                end
                DCT: begin
                    if (counter == N-1) begin
                        state <= IDCT;
                        counter <= 0;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                IDCT: begin
                    if (counter == N-1) begin
                        state <= DONE;
                    end else begin
                        counter <= counter + 1;
                    end
                end
                DONE: begin
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

    // DCT calculation
    always @(posedge clk) begin
        if (state == DCT) begin
            dct_coeffs[counter] <= (in1 * c[0] + in2 * c[1] + in3 * c[2] + in4 * c[3] +
                                    in5 * c[4] + in6 * c[5] + in7 * c[6] + in8 * c[7]) >> 14;
        end
    end

    // IDCT calculation
    always @(posedge clk) begin
        if (state == IDCT) begin
            idct_outputs[counter] <= (dct_coeffs[0] * c[0] + dct_coeffs[1] * c[1] + 
                                      dct_coeffs[2] * c[2] + dct_coeffs[3] * c[3] +
                                      dct_coeffs[4] * c[4] + dct_coeffs[5] * c[5] + 
                                      dct_coeffs[6] * c[6] + dct_coeffs[7] * c[7]) >> 14;
        end
    end

    // Output assignment
    always @(posedge clk) begin
        if (state == DONE) begin
            out1 <= idct_outputs[0];
            out2 <= idct_outputs[1];
            out3 <= idct_outputs[2];
            out4 <= idct_outputs[3];
            out5 <= idct_outputs[4];
            out6 <= idct_outputs[5];
            out7 <= idct_outputs[6];
            out8 <= idct_outputs[7];
        end
    end

endmodule