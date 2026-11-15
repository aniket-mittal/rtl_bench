module origen_019585 (
    input wire clk,
    input wire i_value,
    input wire sync_reset,
    input wire async_reset,
    input wire async_reset_n,
    output reg o_value_sync_reset,
    output reg o_value_async_reset,
    output reg o_value_async_reset_n,
    output reg o_value_mixed_reset,
    output reg o_value_no_reset
);

    // Synchronous Reset Flip-Flop
    always @(posedge clk) begin
        if (sync_reset)
            o_value_sync_reset <= 1'b0;
        else
            o_value_sync_reset <= i_value;
    end

    // Asynchronous Reset Flip-Flop
    always @(posedge clk or posedge async_reset) begin
        if (async_reset)
            o_value_async_reset <= 1'b0;
        else
            o_value_async_reset <= i_value;
    end

    // Asynchronous Active-Low Reset Flip-Flop
    always @(posedge clk or negedge async_reset_n) begin
        if (!async_reset_n)
            o_value_async_reset_n <= 1'b0;
        else
            o_value_async_reset_n <= i_value;
    end

    // Mixed Reset Flip-Flop
    always @(posedge clk or posedge async_reset) begin
        if (async_reset)
            o_value_mixed_reset <= 1'b0;
        else if (sync_reset)
            o_value_mixed_reset <= 1'b0;
        else
            o_value_mixed_reset <= i_value;
    end

    // No Reset Flip-Flop
    always @(posedge clk) begin
        o_value_no_reset <= i_value;
    end

endmodule