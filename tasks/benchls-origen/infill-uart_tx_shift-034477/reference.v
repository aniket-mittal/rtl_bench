module origen_034477(
    input wire clk,
    input wire RESET,
    input wire [7:0] data,
    input wire send_pluse,
    output reg bit8,
    output reg TXD
);

    reg [3:0] cnt;
    reg [7:0] sendsign;
    reg [1:0] state;

    localparam IDLE = 2'b00;
    localparam SEND = 2'b01;

    always @(posedge clk or posedge RESET) begin
        if (RESET) begin
            state <= IDLE;
            TXD <= 1'b1;
            bit8 <= 1'b0;
            cnt <= 4'd0;
        end else begin
            case (state)
                IDLE: begin
                    TXD <= 1'b1;
                    bit8 <= 1'b0;
                    if (send_pluse) begin
                        state <= SEND;
                        sendsign <= data;
                        cnt <= 4'd0;
                    end
                end

                SEND: begin
                    if (cnt < 4'd15) begin
                        cnt <= cnt + 1'b1;
                    end else begin
                        cnt <= 4'd0;
                        if (sendsign == 8'd0) begin
                            TXD <= 1'b1;
                            bit8 <= 1'b1;
                            state <= IDLE;
                        end else begin
                            TXD <= sendsign[0];
                            sendsign <= {1'b1, sendsign[7:1]};
                        end
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule