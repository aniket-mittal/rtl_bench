module origen_018345
    #(
        parameter DBIT = 8,     // # data bits
        parameter SB_TICK = 16  // # ticks for stop bits
    )
    (
        input wire clk, reset,
        input wire tx_start, s_tick,
        input wire [7:0] din,
        output reg tx_done_tick,
        output wire tx
    );

    // symbolic state declaration
    localparam [1:0]
        idle  = 2'b00,
        start = 2'b01,
        data  = 2'b10,
        stop  = 2'b11;

    // signal declaration
    reg [1:0] state_reg, state_next;
    reg [3:0] s_reg, s_next;
    reg [2:0] n_reg, n_next;
    reg [7:0] b_reg, b_next;
    reg tx_reg, tx_next;

    // body
    // FSMD state & data registers
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            begin
                state_reg <= idle;
                s_reg <= 0;
                n_reg <= 0;
                b_reg <= 0;
                tx_reg <= 1'b1;
            end
        else
            begin
                state_reg <= state_next;
                s_reg <= s_next;
                n_reg <= n_next;
                b_reg <= b_next;
                tx_reg <= tx_next;
            end
    end

    // FSMD next-state logic & functional units
    [MASKED]

    // output
    assign tx = tx_reg;

endmodule