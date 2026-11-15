module autovcoder_142656(
    input clk,
    input rst,
    input start,
    input data_in,
    output reg [1:0] data_out,
    output reg done
);
    reg [3:0] state;
    reg [3:0] interleaver [0:15];
    reg [3:0] interleaved_index;
    
    initial begin
        // Initialize interleaver
        // Example interleaver mapping
        interleaver[0] = 0; interleaver[1] = 4; interleaver[2] = 8; interleaver[3] = 12;
        interleaver[4] = 1; interleaver[5] = 5; interleaver[6] = 9; interleaver[7] = 13;
        interleaver[8] = 2; interleaver[9] = 6; interleaver[10] = 10; interleaver[11] = 14;
        interleaver[12] = 3; interleaver[13] = 7; interleaver[14] = 11; interleaver[15] = 15;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0;
            data_out <= 0;
            done <= 0;
            interleaved_index <= 0;
        end else if (start) begin
            case (state)
                0: begin
                    data_out[0] <= data_in; // First encoder output
                    interleaved_index <= interleaver[state]; // Get interleaved index
                    state <= 1;
                end
                1: begin
                    data_out[1] <= data_in; // Second encoder output (interleaved)
                    state <= 2;
                end
                2: begin
                    done <= 1; // Encoding complete
                    state <= 0; // Reset state
                end
            endcase
        end
    end
endmodule