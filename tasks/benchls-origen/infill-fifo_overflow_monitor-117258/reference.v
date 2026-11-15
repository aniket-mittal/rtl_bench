module origen_117258 #(
    parameter WIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] sample_data,
    input wire sample_valid,
    input wire fifo_ready,
    output reg [WIDTH-1:0] fifo_data,
    output reg fifo_overflow,
    output reg fifo_valid
);

    reg [15:0] ov_counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ov_counter <= 16'b0;
            fifo_data <= {WIDTH{1'b0}};
            fifo_overflow <= 1'b0;
            fifo_valid <= 1'b0;
        end else begin
            if (ov_counter == 16'b0) begin
                // Passthrough mode
                fifo_data <= sample_data;
                fifo_valid <= sample_valid;
                fifo_overflow <= 1'b0;

                // Check for overflow condition
                if (sample_valid && !fifo_ready) begin
                    ov_counter <= 16'h1;
                end
            end else begin
                // Overflow counting mode
                fifo_data[15:0] <= ov_counter;
                if (WIDTH > 16) begin
                    fifo_data[WIDTH-1:16] <= sample_data[WIDTH-1:16];
                end
                fifo_valid <= 1'b1;
                fifo_overflow <= 1'b1;

                // Increment overflow counter if conditions are met
                if (sample_valid && !fifo_ready && ov_counter != 16'hFFFF) begin
                    ov_counter <= ov_counter + 1'b1;
                end else if (fifo_ready) begin
                    // Exit overflow counting mode
                    ov_counter <= 16'b0;
                end
            end
        end
    end

endmodule