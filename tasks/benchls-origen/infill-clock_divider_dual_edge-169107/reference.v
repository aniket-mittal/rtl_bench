module origen_169107(
    output reg clock_o,
    input clock_i,
    input reset,
    input [31:0] F_DIV
);

    reg [31:0] count_p;
    reg [31:0] count_n;
    reg clock_o_p;
    reg clock_o_n;

    always @(posedge clock_i or posedge reset) begin
        if (reset) begin
            count_p <= 0;
            clock_o_p <= 0;
        end else begin
            if (count_p == (F_DIV >> 1) - 1) begin
                clock_o_p <= ~clock_o_p;
            end
            if (count_p == F_DIV - 1) begin
                count_p <= 0;
                clock_o_p <= ~clock_o_p;
            end else begin
                count_p <= count_p + 1;
            end
        end
    end

    always @(negedge clock_i or posedge reset) begin
        if (reset) begin
            count_n <= 0;
            clock_o_n <= 0;
        end else begin
            if (count_n == (F_DIV >> 1) - 1) begin
                clock_o_n <= ~clock_o_n;
            end
            if (count_n == F_DIV - 1) begin
                count_n <= 0;
                clock_o_n <= ~clock_o_n;
            end else begin
                count_n <= count_n + 1;
            end
        end
    end

    always @(*) begin
        if (F_DIV[0] == 1) begin
            clock_o = clock_o_p & clock_o_n;
        end else begin
            clock_o = clock_o_p;
        end
    end

endmodule