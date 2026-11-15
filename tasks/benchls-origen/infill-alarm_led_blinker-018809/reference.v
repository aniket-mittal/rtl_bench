module origen_018809(
    input wire clk,
    input wire rst,
    input wire btn0,
    input wire btn1,
    input wire open,
    output wire led0,
    output wire led1,
    output wire led2,
    output wire led3,
    output wire led4,
    output wire led5,
    output wire led6,
    output wire led7
);

    reg [25:0] count;
    reg flag;
    wire led_out;

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 26'd0;
        else if (count == 26'd49_999_999)
            count <= 26'd0;
        else
            count <= count + 1'b1;
    end

    // Alarm state logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            flag <= 1'b0;
        else if (btn0)
            flag <= 1'b0;
        else if (btn1)
            flag <= 1'b1;
    end

    // LED control logic
    assign led_out = flag & (~open) & count[25];

    // LED output assignments
    assign led0 = led_out;
    assign led1 = led_out;
    assign led2 = led_out;
    assign led3 = led_out;
    assign led4 = led_out;
    assign led5 = led_out;
    assign led6 = led_out;
    assign led7 = led_out;

endmodule