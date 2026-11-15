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
always @(posedge clk or posedge reset) begin
    if (reset) begin
        sec <= 6'd0;
        min <= 6'd0;
        hr <= 5'd12;
        ampm <= 1'b0;
    end else if (tick_1hz) begin
        if (sec == 6'd59) begin
            sec <= 6'd0;
            if (min == 6'd59) begin
                min <= 6'd0;
                if (hr == 5'd12) begin
                    hr <= 5'd1;
                    ampm <= ~ampm;
                end else if (hr == 5'd11) begin
                    hr <= 5'd12;
                end else begin
                    hr <= hr + 1'b1;
                end
            end else begin
                min <= min + 1'b1;
            end
        end else begin
            sec <= sec + 1'b1;
        end
    end
end

endmodule