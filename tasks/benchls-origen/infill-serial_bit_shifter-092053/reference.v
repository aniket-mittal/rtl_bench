module origen_092053 (
    input [3:0] din,
    input clk,
    input rst,
    output reg dout
);

    reg [1:0] count;

    always @(posedge clk) begin
        if (rst) begin
            dout <= 0;
            count <= 0;
            ;
        end else begin
            case (count)
                2'b00: dout <= din[3];
                2'b01: dout <= din[2];
                2'b10: dout <= din[1];
                2'b11: dout <= din[0];
            endcase
            count <= count + 1;
            ;
        end
    end
endmodule

