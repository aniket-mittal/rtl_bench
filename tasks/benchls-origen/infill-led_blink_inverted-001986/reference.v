module origen_001986 #(
    parameter WIDTH = 8
) (
    input wire CLK,
    input wire RST,
    output wire [WIDTH-1:0] LED,
    output reg [WIDTH-1:0] INV_LED
);

    wire [WIDTH-1:0] led_out;

    sub_blinkled #(
        .WIDTH(WIDTH)
    ) sub_blink (
        .CLK(CLK),
        .RST(RST),
        .LED(led_out)
    );

    assign LED = led_out;

    always @(posedge CLK) begin
        if (RST)
            INV_LED <= {WIDTH{1'b0}};
        else
            INV_LED <= ~led_out;
    end

endmodule

module sub_blinkled #(
    parameter WIDTH = 8
) (
    input wire CLK,
    input wire RST,
    output reg [WIDTH-1:0] LED
);

    reg [31:0] counter;

    always @(posedge CLK) begin
        if (RST) begin
            counter <= 32'd0;
            LED <= {WIDTH{1'b0}};
        end
        else begin
            if (counter == 32'd1023) begin
                counter <= 32'd0;
                LED <= LED + 1'b1;
            end
            else begin
                counter <= counter + 1'b1;
            end
        end
    end

endmodule