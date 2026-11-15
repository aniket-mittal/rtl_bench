module origen_116434(
    input wire clk,
    input wire divClk,
    input wire TxD_busy,
    output reg TxD_start,
    output reg [7:0] TxD_data
);

    reg [7:0] data [0:4];
    reg [2:0] char;
    reg [3:0] state;
    reg [19:0] div;

    initial begin
        data[0] = "h";
        data[1] = "e";
        data[2] = "l";
        data[3] = "l";
        data[4] = "o";
        char = 0;
        state = 0;
        div = 0;
        TxD_start = 0;
        TxD_data = 0;
    end

    [MASKED]

endmodule