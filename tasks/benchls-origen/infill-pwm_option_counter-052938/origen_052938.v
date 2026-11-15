module origen_052938 (
    input wire CLK,
    input wire RSTn,
    input wire [4:0] Option_Key,
    output reg Out_Pin
);

    parameter SEGMENT = 195;

    reg [7:0] C1;
    reg [7:0] System_Seg;
    reg [7:0] Option_Seg;

    // Clock Divider
    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            C1 <= 8'd0;
        else if (C1 == SEGMENT - 1)
            C1 <= 8'd0;
        else
            C1 <= C1 + 1'b1;
    end

    // System Counter
    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            System_Seg <= 8'd0;
        else if (C1 == SEGMENT - 1)
            System_Seg <= System_Seg + 1'b1;
    end

    // Option Counter
    [MASKED]

    // PWM Output
    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            Out_Pin <= 1'b0;
        else
            Out_Pin <= (System_Seg < Option_Seg);
    end

endmodule