module origen_018511 (
    input wire CLK,
    input wire RST,
    input wire write,
    input wire [31:0] Tao_Q,
    output reg [31:0] Tao_cnt,
    output reg [31:0] data,
    output reg [31:0] tmp_cnt,
    output reg ready,
    output reg read_for_slave
);

    initial begin
        Tao_cnt = 32'hFF;
        data = 32'h0;
        tmp_cnt = 32'h0;
        ready = 1'b0;
        read_for_slave = 1'b0;
    end

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            data <= 32'h0;
            tmp_cnt <= 32'h0;
            ready <= 1'b0;
            read_for_slave <= 1'b0;
        end
        else if (write) begin
            Tao_cnt <= Tao_Q;
            data <= 32'h0;
            tmp_cnt <= 32'h0;
            ready <= 1'b0;
            read_for_slave <= 1'b0;
        end
        else begin
            if (tmp_cnt == Tao_cnt) begin
                data <= data + 1;
                ready <= 1'b1;
                read_for_slave <= 1'b1;
                tmp_cnt <= 32'h0;
            end
            else begin
                tmp_cnt <= tmp_cnt + 1;
                ready <= 1'b0;
                read_for_slave <= 1'b0;
            end
        end
    end

endmodule