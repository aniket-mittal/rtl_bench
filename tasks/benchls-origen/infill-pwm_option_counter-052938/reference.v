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
    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            Option_Seg <= 8'd127;
        else if (Option_Key[4] && Option_Seg <= 8'd245)
            Option_Seg <= Option_Seg + 8'd10;
        else if (Option_Key[3] && Option_Seg >= 8'd10)
            Option_Seg <= Option_Seg - 8'd10;
        else if (Option_Key[2] && Option_Seg < 8'd255)
            Option_Seg <= Option_Seg + 8'd1;
        else if (Option_Key[1] && Option_Seg > 8'd0)
            Option_Seg <= Option_Seg - 8'd1;
        else if (Option_Key[0])
            Option_Seg <= 8'd127;
    end

    // PWM Output
    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            Out_Pin <= 1'b0;
        else
            Out_Pin <= (System_Seg < Option_Seg);
    end

endmodule