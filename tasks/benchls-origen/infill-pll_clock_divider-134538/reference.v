module origen_134538 (
    input wire inclk0,
    input wire areset,
    output reg c0,
    output reg c1,
    output reg locked
);

    reg [3:0] counter;
    reg pll_locked;

    // PLL lock simulation
    always @(posedge inclk0 or posedge areset) begin
        if (areset) begin
            pll_locked <= 1'b0;
        end else begin
            pll_locked <= 1'b1;
        end
    end

    // Counter for clock division
    always @(posedge inclk0 or posedge areset) begin
        if (areset) begin
            counter <= 4'd0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    // Generate c0 (4 MHz)
    always @(posedge inclk0 or posedge areset) begin
        if (areset) begin
            c0 <= 1'b0;
        end else begin
            c0 <= (counter[2:0] == 3'b000);
        end
    end

    // Generate c1 (2 MHz)
    always @(posedge inclk0 or posedge areset) begin
        if (areset) begin
            c1 <= 1'b0;
        end else begin
            c1 <= (counter[3:0] == 4'b0000);
        end
    end

    // Generate locked signal
    always @(posedge inclk0 or posedge areset) begin
        if (areset) begin
            locked <= 1'b0;
        end else begin
            locked <= pll_locked;
        end
    end

endmodule