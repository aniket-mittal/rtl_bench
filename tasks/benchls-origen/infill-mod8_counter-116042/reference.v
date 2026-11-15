// Main Module
module origen_116042(
    input wire Clr,
    input wire Clock,
    output reg [2:0] Q
);

    parameter MaxCount = 3'b111;  // Maximum count value (8)

    always @(posedge Clock or posedge Clr) begin
        if (Clr)
            Q <= 3'b000;  // Reset counter when Clr is asserted
        else if (Q == MaxCount)
            Q <= 3'b000;  // Reset counter when maximum count is reached
        else
            Q <= Q + 1;   // Increment counter
    end

endmodule

// Testbench Module
