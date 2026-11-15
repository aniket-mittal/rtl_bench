module origen_052186 (
    input wire clk_in,
    input wire rst_in,
    input wire pause_0_in,
    input wire unpause_0_in,
    input wire pause_unpause_0_in,
    output wire inject_pause_out
);

    reg pause_0_reg, unpause_0_reg;
    reg set_pause_0, reset_pause_0;
    reg pause_unpause_0_gen;
    reg pause_unpause_0_reg;

    // Edge detection for pause and unpause signals
    always @(posedge clk_in or posedge rst_in) begin
        if (rst_in) begin
            pause_0_reg <= 1'b0;
            unpause_0_reg <= 1'b0;
        end else begin
            pause_0_reg <= pause_0_in;
            unpause_0_reg <= unpause_0_in;
        end
    end

    always @(*) begin
        set_pause_0 = pause_0_in & ~pause_0_reg;
        reset_pause_0 = unpause_0_in & ~unpause_0_reg;
    end

    // State machine for pause_unpause_0_gen
    always @(posedge clk_in or posedge rst_in) begin
        if (rst_in) begin
            pause_unpause_0_gen <= 1'b0;
        end else begin
            if (set_pause_0 & ~reset_pause_0) begin
                pause_unpause_0_gen <= 1'b1;
            end else if (~set_pause_0 & reset_pause_0) begin
                pause_unpause_0_gen <= 1'b0;
            end
        end
    end

    // Register external pause signal
    always @(posedge clk_in or posedge rst_in) begin
        if (rst_in) begin
            pause_unpause_0_reg <= 1'b0;
        end else begin
            pause_unpause_0_reg <= pause_unpause_0_in;
        end
    end

    // Generate final pause injection signal
    assign inject_pause_out = pause_unpause_0_gen | pause_unpause_0_reg;

endmodule