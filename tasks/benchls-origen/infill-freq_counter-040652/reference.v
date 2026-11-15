module origen_040652 (
    input wire clk,
    input wire reset,
    input wire ingang,
    input wire slowClk,
    output reg [7:0] uitvoer
);

    reg [24:0] count;
    reg [7:0] freq;
    reg in, in_prev;
    wire resetMore;

    // Input registration
    always @(posedge clk or posedge reset) begin
        if (reset)
            in <= 1'b0;
        else
            in <= ingang;
    end

    // Edge detection
    always @(posedge clk or posedge reset) begin
        if (reset)
            in_prev <= 1'b0;
        else
            in_prev <= in;
    end

    assign resetMore = reset | (in & ~in_prev);

    // Counter
    always @(posedge clk or posedge resetMore) begin
        if (resetMore)
            count <= 25'b0;
        else
            count <= count + 1'b1;
    end

    // Frequency capture
    always @(posedge clk or posedge reset) begin
        if (reset)
            freq <= 8'b0;
        else if (in & ~in_prev)
            freq <= count[24:17];
    end

    // Output update
    always @(posedge slowClk or posedge reset) begin
        if (reset)
            uitvoer <= 8'b0;
        else
            uitvoer <= freq;
    end

endmodule