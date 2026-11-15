module origen_200410(
    input clk,
    input reset,
    input deserial_on,
    input serial_data_in,
    output reg [70:0] parallel_data_out
);

    localparam S_IDLE = 2'b00;
    localparam S_WORKING = 2'b01;
    localparam S_HOLDING = 2'b10;

    reg [7:0] count;
    reg [1:0] deserial_state;
    reg [7:0] wait_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            parallel_data_out <= 0;
            count <= 0;
            deserial_state <= S_IDLE;
            wait_count <= 0;
        end
        else begin
            case (deserial_state)
                S_IDLE: begin
                    if (deserial_on) begin
                        parallel_data_out <= {parallel_data_out[69:0], serial_data_in};
                        count <= count + 1;
                        deserial_state <= S_WORKING;
                    end
                end
                S_WORKING: begin
                    if (count == 70) begin
                        deserial_state <= S_HOLDING;
                    end
                    else begin
                        parallel_data_out <= {parallel_data_out[69:0], serial_data_in};
                        count <= count + 1;
                    end
                end
                S_HOLDING: begin
                    wait_count <= wait_count + 1;
                    if (wait_count == 8'd1) begin
                        deserial_state <= S_IDLE;
                        count <= 0;
                        wait_count <= 0;
                    end
                end
            endcase
        end
    end

endmodule