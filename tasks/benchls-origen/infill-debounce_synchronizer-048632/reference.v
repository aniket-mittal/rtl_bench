module origen_048632 (
    input wire i_clk,
    input wire i_signal,
    output reg o_state,
    output reg o_trans_dn,
    output reg o_trans_up
);

    // Synchronizer registers
    reg sync_0, sync_1;

    // Counter and control signals
    reg [16:0] counter;
    wire idle;
    wire finished;

    // Synchronizer logic
    always @(posedge i_clk) begin
        sync_0 <= i_signal;
        sync_1 <= sync_0;
    end

    // Counter logic
    assign idle = (o_state == sync_1);
    assign finished = &counter;

    always @(posedge i_clk) begin
        if (idle) begin
            counter <= 17'd0;
        end else begin
            counter <= counter + 17'd1;
        end
    end

    // State transition logic
    always @(posedge i_clk) begin
        if (finished && !idle) begin
            o_state <= sync_1;
        end
    end

    // Transition detection logic
    always @(posedge i_clk) begin
        o_trans_dn <= finished && !idle && !sync_1;
        o_trans_up <= finished && !idle && sync_1;
    end

    // Initial conditions
    initial begin
        o_state = 1'b0;
        o_trans_dn = 1'b0;
        o_trans_up = 1'b0;
        sync_0 = 1'b0;
        sync_1 = 1'b0;
        counter = 17'd0;
    end

endmodule