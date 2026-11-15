module rtlpp_00678 (
    output locked,
    output outclk_0,
    output outclk_1,
    input refclk,
    input rst
);

// Internal variables
reg locked_reg;
reg outclk_0_reg;
reg outclk_1_reg;
reg [31:0] refclk_counter;

// Simple clock divider for demonstration
localparam integer DIVIDER_0 = 2;
localparam integer DIVIDER_1 = 2;

always @(posedge refclk or posedge rst) begin
    if (rst) begin
        refclk_counter <= 0;
        locked_reg <= 0;
        outclk_0_reg <= 0;
        outclk_1_reg <= 0;
    end else begin
        refclk_counter <= refclk_counter + 1;
        if(refclk_counter >= DIVIDER_0 - 1) begin
            refclk_counter <= 0;
            outclk_0_reg <= ~outclk_0_reg;
        end
        if(refclk_counter >= DIVIDER_1 - 1) begin
            outclk_1_reg <= ~outclk_1_reg;
        end
        locked_reg <= (refclk_counter == 0);
    end
end

assign locked = locked_reg;
assign outclk_0 = outclk_0_reg;
assign outclk_1 = outclk_1_reg;

endmodule