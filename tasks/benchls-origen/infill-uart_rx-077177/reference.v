module origen_077177(
    input wire clk,
    input wire rx,
    output reg [7:0] dataout,
    output reg rdsig,
    output reg frameerror,
    input wire paritymode
);

    reg [3:0] state;
    reg [7:0] cnt;
    reg [2:0] bitcnt;
    reg presult;
    reg rx_d1, rx_d2;

    parameter IDLE = 4'd0;
    parameter START = 4'd1;
    parameter RECEIVE = 4'd2;
    parameter PARITY = 4'd3;
    parameter STOP = 4'd4;

    always @(posedge clk) begin
        rx_d1 <= rx;
        rx_d2 <= rx_d1;
    end

    always @(posedge clk) begin
        case(state)
            IDLE: begin
                rdsig <= 0;
                frameerror <= 0;
                if (rx_d2 == 0 && rx_d1 == 1) begin
                    state <= START;
                    cnt <= 0;
                end
            end

            START: begin
                if (cnt == 8'd7) begin
                    state <= RECEIVE;
                    cnt <= 0;
                    bitcnt <= 0;
                    presult <= 0;
                end else begin
                    cnt <= cnt + 1;
                end
            end

            RECEIVE: begin
                if (cnt == 8'd15) begin
                    dataout[bitcnt] <= rx_d2;
                    presult <= presult ^ rx_d2;
                    cnt <= 0;
                    if (bitcnt == 3'd7) begin
                        state <= PARITY;
                    end else begin
                        bitcnt <= bitcnt + 1;
                    end
                end else begin
                    cnt <= cnt + 1;
                end
            end

            PARITY: begin
                if (cnt == 8'd15) begin
                    if ((paritymode == 0 && presult == rx_d2) || 
                        (paritymode == 1 && presult != rx_d2)) begin
                        state <= STOP;
                    end else begin
                        state <= IDLE;
                        frameerror <= 1;
                    end
                    cnt <= 0;
                end else begin
                    cnt <= cnt + 1;
                end
            end

            STOP: begin
                if (cnt == 8'd15) begin
                    if (rx_d2 == 1) begin
                        rdsig <= 1;
                        state <= IDLE;
                    end else begin
                        frameerror <= 1;
                        state <= IDLE;
                    end
                end else begin
                    cnt <= cnt + 1;
                end
            end

            default: state <= IDLE;
        endcase
    end

endmodule