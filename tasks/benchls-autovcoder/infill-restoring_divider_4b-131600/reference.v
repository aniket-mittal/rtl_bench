module autovcoder_131600 (
    input clk,
    input rst,
    input start,
    input [3:0] dividend,
    input [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder,
    output reg done
);
    reg [3:0] A; // Accumulator
    reg [3:0] Q; // Quotient
    reg [3:0] M; // Divisor
    reg [3:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A <= 4'b0000;
            Q <= 4'b0000;
            M <= 4'b0000;
            count <= 4'b0000;
            done <= 0;
        end else if (start) begin
            A <= dividend;
            Q <= 4'b0000;
            M <= divisor;
            count <= 4'b0000;
            done <= 0;
        end else if (count < 4) begin
            {A, Q} <= {A, Q} << 1; // Shift left
            A <= A - M; // Subtract divisor
            if (A[3] == 1) begin // If A is negative
                A <= A + M; // Restore A
                Q <= {Q[2:0], 1'b0}; // Shift in 0
            end else begin
                Q <= {Q[2:0], 1'b1}; // Shift in 1
            end
            count <= count + 1; // Increment count
        end else begin
            remainder <= A; // Final remainder
            quotient <= Q; // Final quotient
            done <= 1; // Indicate done
        end
    end
endmodule