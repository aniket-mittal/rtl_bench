module origen_107618 #(
    parameter DIVISOR = 694
) (
    input wire clk_in,
    input wire rst_in,
    input wire trigger_in,
    input wire [7:0] val_in,
    output reg done,
    output wire data_out
);

    reg [9:0] shift_buffer;
    reg [31:0] count;
    reg [3:0] sent;
    reg transmitting;

    assign data_out = ~shift_buffer[0];

    always @(posedge clk_in or posedge rst_in) begin
        if (rst_in) begin
            shift_buffer <= 10'b1111111111;
            count <= 32'd0;
            sent <= 4'd0;
            done <= 1'b0;
            transmitting <= 1'b0;
        end else begin
            if (trigger_in && !transmitting) begin
                shift_buffer <= {1'b1, ~val_in, 1'b0};
                count <= 32'd0;
                sent <= 4'd0;
                done <= 1'b0;
                transmitting <= 1'b1;
            end else if (transmitting) begin
                if (count == DIVISOR - 1) begin
                    count <= 32'd0;
                    shift_buffer <= {1'b1, shift_buffer[9:1]};
                    sent <= sent + 1'b1;
                    if (sent == 4'd9) begin
                        transmitting <= 1'b0;
                        done <= 1'b1;
                    end
                end else begin
                    count <= count + 1'b1;
                end
            end else begin
                shift_buffer <= 10'b1111111111;
                count <= 32'd0;
                sent <= 4'd0;
                done <= 1'b0;
            end
        end
    end

endmodule