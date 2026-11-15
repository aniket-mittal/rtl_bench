module origen_045782 (
    input wire CLK,
    input wire RST,
    input wire [31:0] in_a,
    input wire [31:0] in_b,
    output reg [63:0] Product,
    output reg Product_Valid
);

    reg [63:0] Mplicand;
    reg [31:0] Mplier;
    reg [6:0] Counter;
    reg sign;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            Product <= 64'b0;
            Mplicand <= 64'b0;
            Mplier <= 32'b0;
            Counter <= 7'b0;
            sign <= 1'b0;
            Product_Valid <= 1'b0;
        end
        else begin
            case (Counter)
                7'd0: begin
                    Mplicand <= {32'b0, in_a};
                    Mplier <= in_b;
                    Product <= 64'b0;
                    Counter <= Counter + 1'b1;
                    Product_Valid <= 1'b0;
                end
                7'd32: begin
                    Product_Valid <= 1'b1;
                    Counter <= Counter + 1'b1;
                end
                7'd33: begin
                    Product_Valid <= 1'b0;
                    Counter <= 7'd0;
                end
                default: begin
                    if (Mplier[0])
                        Product <= Product + Mplicand;
                    Mplicand <= Mplicand << 1;
                    Mplier <= Mplier >> 1;
                    Counter <= Counter + 1'b1;
                end
            endcase
        end
    end

endmodule