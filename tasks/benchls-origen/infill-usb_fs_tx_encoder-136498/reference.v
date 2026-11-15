module origen_136498 (
    input wire clk,
    input wire rst0_async,
    input wire rst0_sync,
    input wire usb_interpack,
    input wire encfifo_wr,
    input wire [7:0] encfifo_wdata,
    input wire remote_wakeup,
    input wire speed,
    output reg dtx_plus,
    output reg dtx_minus,
    output reg dtx_oe,
    output reg encfifo_full
);

    // Internal signals
    reg usb_j, usb_k;
    reg encfifo_empty;
    reg encfifo_rd;
    reg [7:0] encfifo_rdata;
    reg [17:0] counter;
    reg [2:0] stuffbit;
    reg [3:0] enc_state;

    // State definitions
    localparam ENC_IDLE   = 4'b0000;
    localparam ENC_TIME1  = 4'b0001;
    localparam ENC_DRIVE  = 4'b0010;
    localparam ENC_STUFF  = 4'b0011;
    localparam ENC_SE0    = 4'b0100;
    localparam ENC_TIME2  = 4'b0101;
    localparam ENC_DRIVEJ = 4'b0110;
    localparam ENC_TIME3  = 4'b0111;
    localparam ENC_DRIVEK = 4'b1000;

    always @(posedge clk or negedge rst0_async) begin
        if (!rst0_async) begin
            dtx_plus <= 1'b0;
            dtx_minus <= 1'b0;
            dtx_oe <= 1'b0;
            encfifo_full <= 1'b0;
            usb_j <= 1'b0;
            usb_k <= 1'b0;
            encfifo_empty <= 1'b1;
            encfifo_rd <= 1'b0;
            encfifo_rdata <= 8'b0;
            counter <= 18'b0;
            stuffbit <= 3'b0;
            enc_state <= ENC_IDLE;
        end else if (!rst0_sync) begin
            dtx_plus <= 1'b0;
            dtx_minus <= 1'b0;
            dtx_oe <= 1'b0;
            encfifo_full <= 1'b0;
            usb_j <= 1'b0;
            usb_k <= 1'b0;
            encfifo_empty <= 1'b1;
            encfifo_rd <= 1'b0;
            encfifo_rdata <= 8'b0;
            counter <= 18'b0;
            stuffbit <= 3'b0;
            enc_state <= ENC_IDLE;
        end else begin
            case (enc_state)
                ENC_IDLE: begin
                    stuffbit <= 3'b0;
                    counter <= 18'b0;
                    encfifo_rd <= 1'b0;
                    if (!encfifo_empty || remote_wakeup) begin
                        enc_state <= ENC_TIME1;
                    end
                end
                ENC_TIME1: begin
                    counter <= counter + 1;
                    if (counter == (speed ? 18'd7 : 18'd55)) begin
                        enc_state <= ENC_DRIVE;
                        counter <= 18'b0;
                    end
                end
                ENC_DRIVE: begin
                    if (!encfifo_empty) begin
                        encfifo_rd <= 1'b1;
                        usb_j <= encfifo_rdata[0];
                        usb_k <= ~encfifo_rdata[0];
                        stuffbit <= stuffbit + 1;
                        if (stuffbit == 3'b110) begin
                            enc_state <= ENC_STUFF;
                        end else begin
                            enc_state <= ENC_TIME2;
                        end
                    end else if (remote_wakeup) begin
                        usb_k <= 1'b1;
                        usb_j <= 1'b0;
                        enc_state <= ENC_TIME2;
                    end else begin
                        enc_state <= ENC_SE0;
                    end
                end
                ENC_STUFF: begin
                    usb_j <= ~usb_j;
                    usb_k <= ~usb_k;
                    stuffbit <= 3'b0;
                    enc_state <= ENC_TIME2;
                end
                ENC_SE0: begin
                    usb_j <= 1'b0;
                    usb_k <= 1'b0;
                    counter <= counter + 1;
                    if (counter == (speed ? 18'd7 : 18'd55)) begin
                        enc_state <= ENC_DRIVEJ;
                        counter <= 18'b0;
                    end
                end
                ENC_TIME2: begin
                    counter <= counter + 1;
                    if (counter == (speed ? 18'd7 : 18'd55)) begin
                        enc_state <= ENC_DRIVE;
                        counter <= 18'b0;
                    end
                end
                ENC_DRIVEJ: begin
                    usb_j <= 1'b1;
                    usb_k <= 1'b0;
                    enc_state <= ENC_TIME3;
                end
                ENC_TIME3: begin
                    counter <= counter + 1;
                    if (counter == (speed ? 18'd7 : 18'd55)) begin
                        if (usb_interpack) begin
                            enc_state <= ENC_DRIVEK;
                        end else begin
                            enc_state <= ENC_IDLE;
                        end
                        counter <= 18'b0;
                    end
                end
                ENC_DRIVEK: begin
                    usb_j <= 1'b0;
                    usb_k <= 1'b1;
                    enc_state <= ENC_IDLE;
                end
                default: enc_state <= ENC_IDLE;
            endcase

            dtx_plus <= usb_j;
            dtx_minus <= usb_k;
            dtx_oe <= usb_j | usb_k;
        end
    end

endmodule