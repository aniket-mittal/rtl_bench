module origen_128077 (
    input CLOCK_50,
    input [1:0] KEY,
    input req,
    output reg [7:0] value_0, value_1, value_2,
    output reg value_0_valid, value_1_valid, value_2_valid
);

    reg running;
    reg [25:0] timer_counter;
    reg [3:0] write_counter;
    reg ack;

    // Timer to toggle running signal every second
    always @(posedge CLOCK_50) begin
        if (timer_counter == 26'd49999999) begin
            timer_counter <= 26'd0;
            running <= ~running;
        end else begin
            timer_counter <= timer_counter + 1'b1;
        end
    end

    // Write to registers
    always @(posedge CLOCK_50) begin
        if (!KEY[0]) begin
            value_0 <= 8'h55;
            value_0_valid <= 1'b1;
        end

        if (!KEY[1]) begin
            value_1 <= 8'hAA;
            value_1_valid <= 1'b1;
        end

        if (running && req) begin
            if (write_counter == 4'd9) begin
                value_2 <= 8'h00;
                value_2_valid <= 1'b0;
                write_counter <= 4'd0;
            end else begin
                write_counter <= write_counter + 1'b1;
            end

            if (ack) begin
                value_2_valid <= 1'b1;
            end
        end else begin
            write_counter <= 4'd0;
        end
    end

    // Simulate acknowledgement
    always @(posedge CLOCK_50) begin
        ack <= (value_2 == 8'h00 && !value_2_valid);
    end

endmodule