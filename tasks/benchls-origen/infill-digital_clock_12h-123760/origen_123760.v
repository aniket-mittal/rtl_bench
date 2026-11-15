module origen_123760 (
    input wire clk,
    input wire reset,
    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [4:0] hr,
    output reg ampm
);

// Internal signals
reg [25:0] counter;
wire tick_1hz;

// Generate 1Hz tick from 50MHz clock
always @(posedge clk or posedge reset) begin
    if (reset)
        counter <= 26'd0;
    else if (counter == 26'd49999999)
        counter <= 26'd0;
    else
        counter <= counter + 1'b1;
end

assign tick_1hz = (counter == 26'd49999999);

// Update time
[MASKED]

endmodule