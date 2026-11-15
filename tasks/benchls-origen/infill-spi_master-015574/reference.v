module origen_015574 #(
    parameter DIV = 4,
    parameter DW = 32
) (
    input wire clk,
    input wire rst,
    input wire quad,
    input wire [DW-1:0] din,
    input wire din_valid,
    output reg din_ready,
    output reg [DW-1:0] dout,
    output reg dout_valid,
    input wire dout_ready,
    output reg sck,
    input wire miso,
    output wire mosi
);

    localparam IDLE = 2'b00;
    localparam BUSY = 2'b01;
    localparam ACK = 2'b10;

    reg [1:0] state;
    reg [DW-1:0] data_reg;
    reg [5:0] cnt;
    reg [5:0] tgt;
    reg [($clog2(DIV)-1):0] div_cnt;
    reg quad_mode;

    assign mosi = data_reg[DW-1];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            data_reg <= 0;
            cnt <= 0;
            tgt <= 0;
            div_cnt <= 0;
            sck <= 0;
            din_ready <= 1;
            dout <= 0;
            dout_valid <= 0;
            quad_mode <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (din_valid && din_ready) begin
                        state <= BUSY;
                        data_reg <= din;
                        cnt <= 0;
                        tgt <= quad ? 32 : 8;
                        div_cnt <= 0;
                        sck <= 0;
                        din_ready <= 0;
                        quad_mode <= quad;
                    end
                end

                BUSY: begin
                    div_cnt <= div_cnt + 1;
                    if (div_cnt == DIV/2 - 1) begin
                        sck <= ~sck;
                        if (sck) begin
                            cnt <= cnt + 1;
                            if (quad_mode)
                                data_reg <= {data_reg[DW-5:0], miso, mosi, 2'b00};
                            else
                                data_reg <= {data_reg[DW-2:0], miso};
                        end
                    end else if (div_cnt == DIV - 1) begin
                        sck <= ~sck;
                        div_cnt <= 0;
                        if (cnt == tgt) begin
                            state <= ACK;
                            dout <= data_reg;
                            dout_valid <= 1;
                        end
                    end
                end

                ACK: begin
                    if (dout_ready) begin
                        state <= IDLE;
                        din_ready <= 1;
                        dout_valid <= 0;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule