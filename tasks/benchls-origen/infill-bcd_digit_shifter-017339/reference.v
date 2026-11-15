module origen_017339(
    input wire clk,
    input wire reset,
    input wire [4:0] digito,
    input wire cambio_digito,
    output reg [4:0] u,
    output reg [4:0] d,
    output reg [4:0] c,
    output wire RGB_full
);

    reg [2:0] sel;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            u <= 5'b10000;
            d <= 5'b10000;
            c <= 5'b10000;
            sel <= 3'b000;
        end else begin
            case (sel)
                3'b001: begin
                    u <= digito;
                    d <= 5'b10000;
                    c <= 5'b10000;
                    sel <= 3'b011;
                end
                3'b011: begin
                    u <= digito;
                    d <= u;
                    c <= 5'b10000;
                    sel <= 3'b101;
                end
                3'b101: begin
                    u <= digito;
                    d <= u;
                    c <= d;
                    sel <= 3'b000;
                end
                default: begin
                    if (cambio_digito) begin
                        sel <= 3'b001;
                    end
                end
            endcase
        end
    end

    assign RGB_full = ~(u[4] | d[4] | c[4]);

endmodule