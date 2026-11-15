module origen_080568 (
    input wire clk,
    input wire nRST,
    input wire RXdone,
    output reg req
);

    // State encoding
    localparam WAITFORRXDONE = 3'b000;
    localparam RXDONE = 3'b001;
    localparam REQUESTFOAM = 3'b010;
    localparam CLR = 3'b011;

    // Internal registers
    reg [2:0] cntclick;
    reg [2:0] st;

    // FSM logic
    [MASKED]

endmodule