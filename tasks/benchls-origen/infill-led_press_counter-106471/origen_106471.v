module origen_106471(
    input wire clock,
    input wire reset,
    input wire crash,
    input wire press,
    output reg [7:0][7:0] green
);

    reg [2:0] count;
    reg [7:0] counter;
    reg on;

    [MASKED]

    always @* begin
        green = 64'b0;
        if (!crash) begin
            case (count)
                3'b000: green[2][7] = 1'b1;
                3'b001: green[2][6] = 1'b1;
                3'b010: green[2][5] = 1'b1;
                3'b011: green[2][4] = 1'b1;
                3'b100: green[2][3] = 1'b1;
                3'b101: green[2][2] = 1'b1;
                3'b110: green[2][1] = 1'b1;
                3'b111: green[2][0] = 1'b1;
                default: green = 64'b0;
            endcase
        end
    end

endmodule