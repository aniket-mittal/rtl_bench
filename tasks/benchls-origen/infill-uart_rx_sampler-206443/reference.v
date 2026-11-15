module origen_206443 (
    input        clk,
    input        rst_n,
    input        rs232_rx,
    input        clk_bps,
    output       bps_start,
    output [7:0] rx_data
);

    reg [3:0] rs232_rx0, rs232_rx1, rs232_rx2, rs232_rx3;
    reg [7:0] rx_temp_data;
    reg [3:0] num;
    reg       rx_int;

    wire neg_rs232_rx = ~(rs232_rx0[3] & rs232_rx1[3] & rs232_rx2[3] & rs232_rx3[3]);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rs232_rx0 <= 4'b1111;
            rs232_rx1 <= 4'b1111;
            rs232_rx2 <= 4'b1111;
            rs232_rx3 <= 4'b1111;
            rx_temp_data <= 8'b0;
            num <= 4'b0;
            rx_int <= 1'b0;
        end
        else begin
            rs232_rx0 <= {rs232_rx0[2:0], rs232_rx};
            rs232_rx1 <= rs232_rx0;
            rs232_rx2 <= rs232_rx1;
            rs232_rx3 <= rs232_rx2;

            if (neg_rs232_rx) begin
                if (num == 4'd0) begin
                    num <= 4'd1;
                end
                else if (num < 4'd9) begin
                    rx_temp_data <= {rs232_rx, rx_temp_data[7:1]};
                    num <= num + 4'd1;
                end
                else begin
                    rx_int <= 1'b1;
                    num <= 4'b0;
                end
            end
            else begin
                rx_int <= 1'b0;
            end
        end
    end

    assign bps_start = (num == 4'd1);
    assign rx_data = rx_temp_data;

endmodule