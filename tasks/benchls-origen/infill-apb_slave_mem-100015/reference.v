module origen_100015 (
    input wire PCLK,
    input wire RESET,
    input wire PENABLE,
    input wire PSEL,
    input wire PWRITE,
    input wire [7:0] PADDR,
    input wire [7:0] PWDATA,
    output reg [3:0] PRDATA
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam SETUP = 2'b01;
    localparam ACCESS = 2'b10;

    reg [1:0] state, next_state;
    reg [7:0] slave [0:255];  // 256 x 8-bit memory array
    reg [7:0] PRDATA1;

    // State machine
    always @(posedge PCLK or negedge RESET) begin
        if (!RESET)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = PSEL ? SETUP : IDLE;
            SETUP: next_state = PENABLE ? ACCESS : SETUP;
            ACCESS: next_state = PSEL ? ACCESS : IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Read/Write operations
    always @(posedge PCLK) begin
        if (state == ACCESS) begin
            if (PWRITE)
                slave[PADDR] <= PWDATA;
            else
                PRDATA1 <= slave[PADDR];
        end
    end

    // Output logic
    always @(posedge PCLK or negedge RESET) begin
        if (!RESET)
            PRDATA <= 4'b0000;
        else
            PRDATA <= PRDATA1[3:0];
    end

endmodule