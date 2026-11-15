module origen_007451 (
    input wire clock,
    input wire extClock_mode,
    input wire [23:0] config_data,
    input wire wrDivider,
    input wire [31:0] dataIn,
    input wire validIn,
    output reg [31:0] dataOut,
    output reg validOut,
    output reg ready50
);

    reg [23:0] divider;
    reg [23:0] counter;
    wire counter_zero;

    // Divider configuration
    always @(posedge clock) begin
        if (wrDivider) begin
            divider <= #1 config_data >> 1;
        end
    end

    // Counter operation
    always @(posedge clock) begin
        if (counter_zero) begin
            counter <= #1 divider;
        end else begin
            counter <= #1 counter - 1'b1;
        end
    end

    assign counter_zero = (counter == 24'd0);

    // Data handling and mode selection
    always @(posedge clock) begin
        if (extClock_mode) begin
            dataOut <= #1 dataIn;
            validOut <= #1 validIn;
        end else if (counter_zero) begin
            dataOut <= #1 dataIn;
            validOut <= #1 validIn;
        end
    end

    // Ready50 signal generation
    always @(posedge clock) begin
        if (counter_zero) begin
            ready50 <= #1 1'b1;
        end else if (counter == (divider >> 1)) begin
            ready50 <= #1 1'b0;
        end
    end

endmodule