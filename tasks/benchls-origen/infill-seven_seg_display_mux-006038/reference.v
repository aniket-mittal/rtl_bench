module origen_006038(
    input wire clr,
    input wire [2:0] sel,
    input wire [7:0] data1, data10, data100, data1000,
    output reg [7:0] de,
    output reg [7:0] ledout
);

    reg [7:0] led_tem, de_tem;

    always @(*) begin
        if (clr) begin
            led_tem = 8'hFF;
            de_tem = 8'hFF;
        end
        else begin
            case (sel)
                3'b000: begin
                    led_tem = data1;
                    de_tem = 8'hFE;
                end
                3'b001: begin
                    led_tem = data10;
                    de_tem = 8'hFD;
                end
                3'b010: begin
                    led_tem = data100;
                    de_tem = 8'hFB;
                end
                3'b011: begin
                    led_tem = data1000;
                    de_tem = 8'hF7;
                end
                3'b100: begin
                    led_tem = 8'hFF;
                    de_tem = 8'hFE;
                end
                3'b101: begin
                    led_tem = 8'hFF;
                    de_tem = 8'hFD;
                end
                default: begin
                    led_tem = 8'hFF;
                    de_tem = 8'hFF;
                end
            endcase
        end

        ledout = led_tem;
        de = de_tem;
    end

endmodule