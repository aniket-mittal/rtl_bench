module origen_106334(
    input [31:0] Z,
    input Clk,
    input classify,
    input RST,
    output reg Hw,
    output reg [15:0] To_Hex
);

    reg Hw_in, Hw_in_in;
    reg [15:0] FACE, FACE_in;
    reg [7:0] counter, counter_in;
    reg [7:0] avg_sum, avg_sum_in;

    always @(posedge Clk or posedge RST) begin
        if (RST) begin
            counter <= 8'd41;
            Hw_in <= 1'b0;
            FACE <= 16'h0000;
            avg_sum <= 8'd0;
        end else begin
            counter <= counter_in;
            Hw_in <= Hw_in_in;
            FACE <= FACE_in;
            avg_sum <= avg_sum_in;
        end
    end

    always @(*) begin
        counter_in = counter;
        Hw_in_in = Hw_in;
        FACE_in = FACE;
        avg_sum_in = avg_sum;

        if (classify) begin
            if (counter > 0) begin
                counter_in = counter - 1;
                Hw_in_in = (Z > 0) ? 1'b1 : 1'b0;
                avg_sum_in = avg_sum + Hw_in_in;
            end else begin
                counter_in = 8'd41;
                if (avg_sum <= 8'd20) begin
                    FACE_in = 16'h0000;
                end else begin
                    FACE_in = 16'hFACE;
                end
                avg_sum_in = 8'd0;
            end
        end

        Hw = Hw_in;
        To_Hex = FACE;
    end

endmodule