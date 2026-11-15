module origen_106707 #(
    parameter WIDTH_I = 16,
    parameter WIDTH_O = 4
)(
    input wire clk,
    input wire cs,
    input wire rw,
    input wire [WIDTH_I-1:0] p_i,
    output reg flow,
    output reg [WIDTH_O-1:0] p_o
);

    reg [WIDTH_I-1:0] p_buf;
    reg [$clog2(WIDTH_I/WIDTH_O)-1:0] counter;
    reg cs_prev;

    always @(posedge clk) begin
        cs_prev <= cs;

        if (WIDTH_I > WIDTH_O) begin
            if (cs && !cs_prev) begin
                if (rw) begin
                    p_buf <= p_i;
                    counter <= WIDTH_I/WIDTH_O - 1;
                    flow <= 0;
                end else begin
                    p_o <= p_buf[WIDTH_I-1:WIDTH_I-WIDTH_O];
                    p_buf <= {p_buf[WIDTH_I-WIDTH_O-1:0], {WIDTH_O{1'b0}}};
                    if (counter == 0) begin
                        flow <= 1;
                    end else begin
                        counter <= counter - 1;
                    end
                end
            end
        end else begin // WIDTH_O > WIDTH_I
            if (cs && !cs_prev) begin
                if (rw) begin
                    p_buf <= {p_buf[WIDTH_O-WIDTH_I-1:0], p_i};
                    if (counter == WIDTH_O/WIDTH_I - 1) begin
                        flow <= 1;
                    end else begin
                        counter <= counter + 1;
                    end
                end else begin
                    p_o <= p_buf;
                    counter <= 0;
                    flow <= 0;
                end
            end
        end
    end

endmodule