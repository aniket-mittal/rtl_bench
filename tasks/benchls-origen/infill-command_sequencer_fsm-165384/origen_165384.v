module origen_165384 (
    input CLK,
    input reset,
    output reg [3:0] command
);

    parameter One = 4'd0, Two = 4'd1, Three = 4'd2, Four = 4'd3,
              Five = 4'd4, Six = 4'd5, Seven = 4'd6, Eight = 4'd7,
              Nine = 4'd8, Ten = 4'd9, Eleven = 4'd10, Twelve = 4'd11,
              Thirteen = 4'd12, Fourteen = 4'd13, Fifteen = 4'd14, Black = 4'd15;

    reg [3:0] current, next;
    reg [3:0] return_state;

    always @(posedge CLK or posedge reset) begin
        if (reset)
            current <= One;
        else
            current <= next;
    end

    [MASKED]

endmodule