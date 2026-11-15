module origen_001778 (
    input wire CP,
    input wire CLR,
    input wire LD,
    input wire M,
    input wire [3:0] D,
    output reg [3:0] Q,
    output reg Qcc
);

    reg [3:0] number;
    reg carry;

    [MASKED]

    always @(*) begin
        Q = number;
        Qcc = carry;
    end

endmodule