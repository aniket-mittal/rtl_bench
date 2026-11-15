module origen_093420 (
    input wire CLK,
    input wire WE,
    input wire [31:0] ABUS,
    input wire [31:0] DBUSI,
    output wire [31:0] DBUSO
);

    parameter FREQ = 50_000_000; // 50MHz clock frequency
    parameter MS_TICKS = FREQ / 1000; // Clock ticks per millisecond

    // Register addresses
    localparam TCNTADDR = 32'hFFFFF100;
    localparam TLIMADDR = 32'hFFFFF104;
    localparam TCTLADDR = 32'hFFFFF108;

    // Registers
    reg [31:0] TCNT;  // Timer count register
    reg [31:0] TLIM;  // Timer limit register
    reg [31:0] TCTL;  // Timer control register

    // Internal signals
    reg [31:0] count;
    wire limit_reached;
    wire overflow;

    assign limit_reached = (TCNT >= TLIM);
    assign overflow = (TCNT == 32'hFFFFFFFF);

    // Main timer logic
    always @(posedge CLK) begin
        // Increment internal counter
        count <= count + 1;

        // Update TCTL flags
        TCTL[0] <= limit_reached | (WE & (ABUS == TCTLADDR) & DBUSI[0]);
        TCTL[1] <= overflow | (WE & (ABUS == TCTLADDR) & DBUSI[1]);

        // Update TCNT
        if (WE & (ABUS == TCNTADDR))
            TCNT <= DBUSI;
        else if (limit_reached)
            TCNT <= 32'h0;
        else if (count == MS_TICKS - 1)
            TCNT <= TCNT + 1;

        // Update TLIM
        if (WE & (ABUS == TLIMADDR))
            TLIM <= DBUSI;

        // Reset internal counter when millisecond is reached
        if (count == MS_TICKS - 1)
            count <= 32'h0;
    end

    // Output logic
    assign DBUSO = (ABUS == TCNTADDR) ? TCNT :
                   (ABUS == TLIMADDR) ? TLIM :
                   (ABUS == TCTLADDR) ? TCTL :
                   32'h0;

endmodule