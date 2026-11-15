module origen_015613 (
    input wire clock,
    input wire reset_n,
    input wire sdo,
    output reg cs,
    output wire sck,
    output reg [15:0] value
);

    reg [19:0] counter;
    reg [15:0] shift;
    wire sample_bit;
    wire value_done;

    // Counter logic
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n)
            counter <= 20'b0;
        else
            counter <= counter + 1'b1;
    end

    // Serial clock generation
    assign sck = counter[1];

    // Chip select control
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n)
            cs <= 1'b1;
        else
            cs <= counter[7];
    end

    // Sample bit control
    assign sample_bit = (counter[1:0] == 2'b11) && !cs;

    // Shift register logic
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n)
            shift <= 16'b0;
        else if (sample_bit)
            shift <= {shift[14:0], sdo};
    end

    // Value done signal
    assign value_done = (counter == 20'b0);

    // Output value register
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n)
            value <= 16'b0;
        else if (value_done)
            value <= shift;
    end

endmodule