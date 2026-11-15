module origen_216845 (
    input clk,
    input rst,
    input send,
    input [7:0] data,
    output reg txd
);

reg [1:0] state;
reg [2:0] cnt;
reg prev_send;

parameter STATE1 = 2'b00;
parameter STATE2 = 2'b01;
parameter STATE3 = 2'b10;
parameter STATE4 = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= STATE1;
        txd <= 1'b1;
        cnt <= 3'b000;
        prev_send <= 1'b0;
    end else begin
        case (state)
            STATE1: begin
                if (send & ~prev_send) begin
                    state <= STATE2;
                    txd <= 1'b0;
                    cnt <= 3'b000;
                end
                prev_send <= send;
            end
            STATE2: begin
                state <= STATE3;
            end
            STATE3: begin
                txd <= data[cnt];
                if (cnt == 3'b111) begin
                    state <= STATE4;
                end else begin
                    cnt <= cnt + 3'b001;
                end
            end
            STATE4: begin
                txd <= 1'b1;
                state <= STATE1;
            end
        endcase
    end
end

endmodule