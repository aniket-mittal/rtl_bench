module origen_210886 (
    input  wire        clk,
    input  wire        rst,
    input  wire        rx_in,
    output reg  [7:0]  data_out,
    output reg         data_avail,
    output reg [15:0]  end_counter,
    output reg         data_error
);

reg [15:0] wait_counter;
reg        running;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wait_counter <= 0;
        running <= 0;
        data_out <= 0;
        data_avail <= 0;
        end_counter <= 0;
        data_error <= 0;
    end else begin
        if (!running && !rx_in) begin
            running <= 1;
            wait_counter <= 0;
        end
        if (running) begin
            wait_counter <= wait_counter + 1;
            if (wait_counter == 433) begin
                data_out[0] <= rx_in;
            end
            if (wait_counter == 866) begin
                data_out[1] <= rx_in;
                data_out[2] <= rx_in;
                data_out[3] <= rx_in;
                data_out[4] <= rx_in;
                data_out[5] <= rx_in;
                data_out[6] <= rx_in;
                data_out[7] <= rx_in;
                if (rx_in) begin
                    data_error <= 0;
                end else begin
                    data_error <= 1;
                end
                data_avail <= 1;
                end_counter <= wait_counter;
                running <= 0;
            end
        end
    end
end

endmodule