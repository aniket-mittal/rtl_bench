module origen_093059 (
    input wire clk,
    input wire rst,
    input wire sin,
    output reg [9:0] packet,
    output reg data_valid
);

    // State definitions
    localparam IDLE = 1'b0;
    localparam ACQUIRE = 1'b1;

    reg state;
    reg [3:0] bit_counter;
    reg [9:0] buffer;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= IDLE;
            bit_counter <= 4'd0;
            buffer <= 10'd0;
            packet <= 10'd0;
            data_valid <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    data_valid <= 1'b0;
                    if (sin == 1'b0) begin  // Start bit detected
                        state <= ACQUIRE;
                        bit_counter <= 4'd1;
                        buffer <= {9'd0, sin};
                    end
                end

                ACQUIRE: begin
                    if (bit_counter < 4'd10) begin
                        buffer <= {sin, buffer[9:1]};
                        bit_counter <= bit_counter + 1'b1;
                    end else begin
                        state <= IDLE;
                        if (sin == 1'b1) begin  // Valid stop bit
                            packet <= buffer;
                            data_valid <= 1'b1;
                        end else begin  // Invalid stop bit
                            packet <= 10'd0;
                            data_valid <= 1'b0;
                        end
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule